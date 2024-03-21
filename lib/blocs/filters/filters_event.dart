import 'package:equatable/equatable.dart';
import 'package:flutter_app_resto/models/price%20_filter_model.dart';


import '../../models/category-fiter.dart';

abstract class FiltersEvent extends Equatable {
  const FiltersEvent();

  @override
  List<Object> get props => [];
}

class LoadedFilter extends FiltersEvent {
  @override
  List<Object> get props => [];
}

class UpdatedCategoryFilter extends FiltersEvent {
  final CategoryFilter categoryFilter;

 const UpdatedCategoryFilter({ required this.categoryFilter,
  });


  @override
  List<Object> get props => [categoryFilter]; 


}

class UpdatedPriceFilter extends FiltersEvent {
  final PriceFilter priceFilter;

   const UpdatedPriceFilter({
    required this.priceFilter,
  });

  @override
  List<Object> get props => [priceFilter];
}
