import 'package:flutter_app_resto/blocs/filters/filters.state.dart';
import 'package:flutter_app_resto/blocs/filters/filters_event.dart';
import 'package:flutter_app_resto/models/category-fiter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../models/filters_model.dart';
import '../../models/price _filter_model.dart';

class FilterBloc extends Bloc<FiltersEvent, FiltersState> {
  FilterBloc() : super(FiltersLoading()) {
    on<LoadedFilter>(_onLoadFilter);
    on<UpdatedCategoryFilter>(_onUpdatedCategoryFilter);
    on<UpdatedPriceFilter>(_onUpdatedPriceFilter);
  }

  void _onLoadFilter(
    LoadedFilter event,
    Emitter<FiltersState> emit,
  ) {
    emit(
      FiltersLoaded(
        filter: Filter(
          categoryFilters: CategoryFilter.filters,
          priceFilters: PriceFilter.filters,
        ),
      ),
    );
  }

  void _onUpdatedCategoryFilter(
    UpdatedCategoryFilter event,
    Emitter<FiltersState> emit,
  ) {
    final state = this.state;
    if (state is FiltersLoaded) {
      final List<CategoryFilter> updatedCategoryFilters =
          state.filter.categoryFilters.map((categoryFilter) {
        return categoryFilter.id == event.categoryFilter.id
            ? event.categoryFilter
            : categoryFilter;
      }).toList();
      emit(
        FiltersLoaded(
          filter: Filter(
            categoryFilters: updatedCategoryFilters,
            priceFilters: state.filter.priceFilters,
          ),
        ),
      );
    }
  }

  void _onUpdatedPriceFilter(
    UpdatedPriceFilter event,
    Emitter<FiltersState> emit,
  ) {
    final state = this.state;
    if (state is FiltersLoaded) {
      final List<PriceFilter> updatedPriceFilters =
          state.filter.priceFilters.map((priceFilter) {
        return priceFilter.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilter;
      }).toList();
      emit(
        FiltersLoaded(
          filter: Filter(
            categoryFilters: state.filter.categoryFilters,
            priceFilters: updatedPriceFilters,
          ),
        ),
      );
    }
  }
}























/*class FilterBloc extends Bloc<FiltersEvent, FiltersState> {
  FilterBloc() : super(FiltersLoading());

  @override
  Stream<FiltersState> mapEventToState(
    FiltersEvent event,
  ) async* {
    if (event is FiltersLoaded) {
      yield* _mapFiltersLoadToState();
    }
    if (event is UpdatedCategoryFilter) {
      yield* _mapCategoryFilterUpdated(event, state);
    }
    if (event is UpdatedPriceFilter) {
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
    UpdatedCategoryFilter event,
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
        ),
      );
    }
  }

  Stream<FiltersState> _mapPriceFilterUpdated(
    UpdatedPriceFilter event,
    FiltersState state,
  ) async* {
    if (state is FiltersLoaded) {
      final List<PriceFilter> updatedPriceFilters =
          state.filter.priceFilters.map((priceFilter) {
        return priceFilter.id == event.priceFilter.id
            ? event.priceFilter
            : priceFilter;
      }).toList();
      yield FiltersLoaded(
        filter: Filter(
          categoryFilters: state.filter.categoryFilters,
          priceFilters: updatedPriceFilters,
        ),
      );
    }
  }
} */
