import 'package:favorite_places_app/app/models/place.dart';
import 'package:favorite_places_app/app/providers/places_provider.dart';
import 'package:favorite_places_app/app/screens/new_place.dart';
import 'package:favorite_places_app/app/widgets/places_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlacesScreen extends ConsumerWidget {
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Place> placesList = ref.watch(placesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your places'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) {
                    return const NewPlaceScreen();
                  },
                ),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: PlacesList(
          places: placesList,
        ),
      ),
    );
  }
}
