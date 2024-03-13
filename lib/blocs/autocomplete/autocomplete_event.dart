import 'package:equatable/equatable.dart';

abstract class AutocompleteEvent extends Equatable {
  const AutocompleteEvent();
  @override
  List<Object> get props => [];
}

class LoadingAutocomplete extends AutocompleteEvent {
  @override
  List<Object> get props => [];
}

class LoadedAutocomplete extends AutocompleteEvent {
  final String searchInput;

  const LoadedAutocomplete({this.searchInput = ""});

  @override
  List<Object> get props => [searchInput];

  String get search => '';
}
class ClearAutocomplete extends AutocompleteEvent {}


