import 'package:flutter/material.dart';
import 'package:flutter_app_resto/blocs/filters/filters.state.dart';
import 'package:flutter_app_resto/blocs/filters/filters_bloc.dart';
import 'package:flutter_app_resto/blocs/filters/filters_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FiltersState>(
      builder: (context, state) {
        if (state is FiltersLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is FiltersLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: state.filter.priceFilters
                .asMap()
                .entries
                .map((price) => InkWell(
                      onTap: () {
                        // Trigger PriceFilterUpdated event with new value
                        context.read<FilterBloc>().add(
                              UpdatedPriceFilter(
                                priceFilter: state
                                    .filter.priceFilters[price.key]
                                    .copyWith(
                                  value: !state
                                      .filter.priceFilters[price.key].value,
                                ),
                              ),
                            );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(
                          top: 10,
                          bottom: 10,
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 10),
                        decoration: BoxDecoration(
                          color: state.filter.priceFilters[price.key].value
                              ? Theme.of(context).primaryColor.withAlpha(100)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Text(
                          state.filter.priceFilters[price.key].price.price,
                          style: Theme.of(context).textTheme.headline5,
                        ),
                      ),
                    ))
                .toList(),
          );
        } else {
          return Text('Something went wrong.');
        }
      },
    );
  }
}
