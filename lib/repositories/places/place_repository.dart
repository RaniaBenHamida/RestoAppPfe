import 'package:flutter_app_resto/models/place_model.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app_resto/models/place_autocomplete_model.dart';
import 'package:flutter_app_resto/repositories/places/base_place_repository.dart';
import 'dart:convert' as convert;

class PlaceRepository extends BasePlaceRepository {
  final String key = 'AIzaSyBjfOjGC5762onjcI-oGd3NLS3vZwZ44sA';
  final String types = 'geocode';
  Future<List<PlaceAutocomplete>> getAutocomplete(String searchInput) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$searchInput&types=$types&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['predictions'] as List;

    return results.map((place) => PlaceAutocomplete.fromJson(place)).toList();
  }

  @override
  Future<Place> getPlace(String placeId) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?place_id=$placeId&key=$key';

    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var results = json['results'] as Map<String, dynamic>;

    return Place.fromJson(results);
  }
}
