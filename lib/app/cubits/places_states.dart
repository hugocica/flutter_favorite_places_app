import 'package:favorite_places_app/app/models/place.dart';

abstract class PlacesState {}

class InitialPlacesState extends PlacesState {}

class LoadingPlacesState extends PlacesState {}

class LoadedPlacesState extends PlacesState {
  final List<Place> places;

  LoadedPlacesState(this.places);
}

class ErrorPlacesState extends PlacesState {}
