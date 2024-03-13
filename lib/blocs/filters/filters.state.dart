
import 'package:equatable/equatable.dart';

import '../../models/filters_model.dart';

abstract class FiltersState extends Equatable {
  const FiltersState();

  @override
  List<Object> get props => [];
}

class FiltersLoading extends FiltersState {
  @override
  List<Object> get props => [];
}

class FiltersLoaded extends FiltersState {
  final Filter filter;

  FiltersLoaded({
     this.filter= const Filter(),
});

   @override
  List<Object> get props => [filter];
}
