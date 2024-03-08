import 'package:flutter_app_resto/models/place_autocomplete_model.dart';
import 'package:flutter_app_resto/models/place_model.dart';

abstract class BasePlaceRepository {
  Future<List<PlaceAutocomplete>> getAutocomplete(String searchInput);

  Future<Place?> getPlace(String placeId) async {}
}

