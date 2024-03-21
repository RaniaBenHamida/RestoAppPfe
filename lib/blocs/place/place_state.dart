import 'package:equatable/equatable.dart';
import 'package:flutter_app_resto/models/place_model.dart';

abstract class PlaceState extends Equatable {
  const PlaceState();
  @override
  List<Object> get props => [];
}

class Placeloading extends PlaceState {
  @override
  List<Object> get props => [];
}

class Placeloaded extends PlaceState {
  final Place place;

  const Placeloaded({required this.place});
  @override
  List<Object> get props => [place];
}

class PlaceError extends PlaceState {}
