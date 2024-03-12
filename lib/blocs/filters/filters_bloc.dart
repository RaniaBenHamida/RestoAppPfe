import 'package:flutter_app_resto/blocs/filters/filters.state.dart';
import 'package:flutter_app_resto/blocs/filters/filters_event.dart';
import 'package:flutter_app_resto/models/category-fiter.dart';
import 'package:flutter_app_resto/models/models.dart';
import 'package:flutter_app_resto/models/price%20_filter_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FilterBloc extends Bloc<FiltersEvent, FiltersState> {
  FilterBloc() : super(FiltersLoading());

  @override
  Stream<FiltersState> mapEventToState(
    FiltersEvent event,
  ) async* {
    if (event is FiltersLoaded) {
      yield* _mapFiltersLoadToState();
    }
    if (event is CategoryFilterUpdated) {
      yield* _mapCategoryFilterUpdated(event, state);
    }
    if (event is PriceFilterUpdated) {
      yield* _mapPriceFilterUpdated(event, state);
    }
  }

  Stream<FiltersState> _mapFiltersLoadToState() async* {
    yield FiltersLoaded(
      filter: Filter(
        categoryFilters: CategoryFilter.filters,
        priceFilters: PriceFilter.filters,
      ),
    );
  }

  Stream<FiltersState> _mapCategoryFilterUpdated(
    CategoryFilterUpdated event,
    FiltersState state,
  ) async* {
    if (state is FiltersLoaded) {
      final List<CategoryFilter> updatedCategoryFilters =
          state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();
      yield FiltersLoaded(
          filter: Filter(
        categoryFilters: updatedCategoryFilters,
        priceFilters: state.filter.priceFilters,
      ));
    }
  }

  Stream<FiltersState> _mapPriceFilterUpdated(
    PriceFilterUpdated event,
    FiltersState state,
  ) async* {
    if (state is FiltersLoaded) {
      final List<PriceFilter> UpdatedPriceFilters =
          state.filter.priceFilters.map((priceFilter) {
        return priceFilter.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilter;
      }).toList();

      yield FiltersLoaded(
          filter: Filter(
        categoryFilters: state.filter.categoryFilters,
        priceFilters: UpdatedPriceFilters,
      ));
    }
  }
}
