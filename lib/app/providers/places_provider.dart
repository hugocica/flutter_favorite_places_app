import 'package:favorite_places_app/app/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

const List<Place> kInitialPlaces = [];

class PlacesNotifier extends StateNotifier<List<Place>> {
  PlacesNotifier() : super(kInitialPlaces);

  void addNewPlace(Place place) {
    state = [...state, place];
  }

  void removePlace(String title) {
    state = state.where((place) => place.title != title).toList();
  }
}

final placesProvider = StateNotifierProvider<PlacesNotifier, List<Place>>(
    (ref) => PlacesNotifier());
