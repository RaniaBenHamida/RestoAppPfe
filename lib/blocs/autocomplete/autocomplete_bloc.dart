import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_resto/blocs/autocomplete/autocomplete_event.dart';
import 'package:flutter_app_resto/blocs/autocomplete/autocomplete_state.dart';
import 'package:flutter_app_resto/models/place_autocomplete_model.dart';
import 'package:flutter_app_resto/repositories/places/place_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AutocompleteBloc extends Bloc<AutocompleteEvent, AutocompleteState> {
  final PlaceRepository _placeRepository;
  StreamSubscription? _streamSubscription;

  AutocompleteBloc({required PlaceRepository placeRepository})
      : _placeRepository = placeRepository,
        super(AutocompleteLoading());

  @override
  Stream<AutocompleteState> mapEventToState(
    AutocompleteEvent event,
  ) async* {
    if (event is LoadedAutocomplete) {
      yield* _mapLoadAutocompleteState(event);
    }
  }

  Stream<AutocompleteState> _mapLoadAutocompleteState(
    LoadedAutocomplete event,
  ) async* {
    _streamSubscription?.cancel();

    try {
      final List<PlaceAutocomplete> autocomplete =
          await _placeRepository.getAutocomplete(event.search);

      yield AutocompleteLoaded(autocomplete: autocomplete);
    } catch (error) {
      (error: error.toString());
    }
  }

  // La méthode close est souvent utilisée pour nettoyer les ressources ou annuler des abonnements.
  // Si elle n'est pas nécessaire, vous pouvez la laisser vide ou la supprimer.
  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}
