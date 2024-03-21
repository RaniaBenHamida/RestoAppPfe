import 'package:equatable/equatable.dart';
import 'package:flutter_app_resto/models/category-fiter.dart';
import 'package:flutter_app_resto/models/price%20_filter_model.dart';

class Filter extends Equatable {
  final List<CategoryFilter> categoryFilters;
  final List<PriceFilter> priceFilters;

  const Filter(
      {this.categoryFilters = const <CategoryFilter>[],
      this.priceFilters = const <PriceFilter>[]});

  Filter copyWith({
    List<CategoryFilter>? categoryFilters,
    List<PriceFilter>? priceFilters,
  }) {
    return Filter(
      categoryFilters: categoryFilters ?? this.categoryFilters,
      priceFilters: priceFilters ?? this.priceFilters,
    );
  }
  
  @override
  List<Object?> get props =>[categoryFilters,priceFilters];
}
