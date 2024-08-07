import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImageInput extends StatefulWidget {
  const ImageInput({super.key, required this.onPickImage});

  final void Function(File image) onPickImage;

  @override
  State<StatefulWidget> createState() {
    return _ImageInputState();
  }
}

class _ImageInputState extends State<ImageInput> {
  File? _image;

  Future<void> _takePicture() async {
    final imagePicker = ImagePicker();
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.camera,
      maxWidth: 800,
      imageQuality: 100,
    );

    if (pickedImage == null) {
      return;
    }

    setState(() {
      _image = File(pickedImage.path);
    });

    widget.onPickImage(_image!);
  }

  @override
  Widget build(BuildContext context) {
    Widget content = TextButton.icon(
      icon: const Icon(Icons.camera),
      label: const Text('Take picture'),
      onPressed: _takePicture,
    );

    if (_image != null) {
      content = Stack(
        children: [
          Positioned(
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.clear),
            ),
          ),
          GestureDetector(
            onTap: _takePicture,
            child: Image.file(
              _image!,
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          )
        ],
      );
    }

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
        ),
        // borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      height: 250,
      width: double.infinity,
      alignment: Alignment.center,
      child: content,
    );
  }
}
