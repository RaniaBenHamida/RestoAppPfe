import 'dart:async';

import 'package:flutter_app_resto/blocs/place/place_event.dart';
import 'package:flutter_app_resto/blocs/place/place_state.dart';
import 'package:flutter_app_resto/models/place_model.dart';
import 'package:flutter_app_resto/repositories/places/place_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PlaceBloc extends Bloc<PlaceEvent, PlaceState> {
  final PlaceRepository _placeRepository;
  StreamSubscription? _placessubscription;

  PlaceBloc({required PlaceRepository placeRepository})
      : _placeRepository = placeRepository,
        super(Placeloading());

  @override
  Stream<PlaceState> mapEventToState(
    PlaceEvent event,
  ) async* {
    if (event is LoadPlace) {
      yield* _mapLoadPLaceToState(event);
    }
  }

  Stream<PlaceState> _mapLoadPLaceToState(LoadPlace event) async* {
    yield Placeloading();
    try {
      _placessubscription?.cancel();
      final Place place = await _placeRepository.getPlace(event.placeId);
      yield Placeloaded(place: place);
    } catch (_) {}
  }

  @override
  Future<void> close() {
    _placessubscription?.cancel();
    return super.close();
  }
}
