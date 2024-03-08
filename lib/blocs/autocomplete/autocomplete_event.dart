import 'package:equatable/equatable.dart';
import 'package:flutter_app_resto/models/place_autocomplete_model.dart';
abstract class AutocompleteEvent extends Equatable {
  const AutocompleteEvent();
  @override
  List<Object> get props => [];
}

class LoadingAutocomplete extends AutocompleteEvent {}

class LoadedAutocomplete extends AutocompleteEvent {
  final String searchInput;

  const LoadedAutocomplete({this.searchInput = ""});

  @override
  List<Object> get props => [searchInput];

  String get search => '';
}
class ClearAutocomplete extends AutocompleteEvent {}


