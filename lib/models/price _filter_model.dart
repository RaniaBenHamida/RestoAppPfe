import 'package:equatable/equatable.dart';
import 'package:flutter_app_resto/models/price_model.dart';

class PriceFilter extends Equatable {
  final int id;
  final Price price;
  final bool value;

  PriceFilter({required this.id, required this.price, required this.value});

  PriceFilter copyWith({
    int? id,
    Price? price,
    bool? value,
  }) {
    return PriceFilter(
        id: id ?? this.id,
        price: price ?? this.price,
        value: value ?? this.value);
  }

  @override
  List<Object?> get props => [
        id,
        price,
        value,
      ];
}

// Assuming this is your list of Price objects
List<Price> pricies = []; // populate this with your actual data

// Now you can create your filters
List<PriceFilter> filters = pricies
    .map((price) => PriceFilter(
          id: price.id,
          price: price,
          value: false,
        ))
    .toList();
