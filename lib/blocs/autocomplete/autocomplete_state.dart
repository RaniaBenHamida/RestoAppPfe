import 'package:equatable/equatable.dart';
import 'package:flutter_app_resto/models/place_autocomplete_model.dart';

abstract class AutocompleteState extends Equatable {
  const AutocompleteState();
  @override
  List<Object> get props => [];
}

class AutocompleteLoading extends AutocompleteState {}

class AutocompleteLoaded extends AutocompleteState {
  final List<PlaceAutocomplete> autocomplete;

  const AutocompleteLoaded({required this.autocomplete});
  @override
  List<Object> get props => [autocomplete];
}

class ClearAutocomplete extends AutocompleteState {}
