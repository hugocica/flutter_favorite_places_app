import 'package:favorite_places_app/app/models/place.dart';
import 'package:flutter/material.dart';

import '../screens/place_details.dart';

class PlacesListItem extends StatelessWidget {
  const PlacesListItem({super.key, required this.place});

  final Place place;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        radius: 26,
        backgroundImage: FileImage(place.image),
      ),
      title: Text(
        place.title,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (ctx) => PlaceDetailsScreen(
              place: place,
            ),
          ),
        );
      },
    );
  }
}
