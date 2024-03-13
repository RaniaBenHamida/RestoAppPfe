import 'package:flutter/material.dart';
import 'package:flutter_app_resto/blocs/filters/filters.state.dart';
import 'package:flutter_app_resto/blocs/filters/filters_bloc.dart';
import 'package:flutter_app_resto/models/category-fiter.dart';
import 'package:flutter_app_resto/models/category_model.dart';
import 'package:flutter_app_resto/models/models.dart';
import 'package:flutter_app_resto/models/price_model.dart';
import 'package:flutter_app_resto/widgets/custom_category_filter.dart';
import 'package:flutter_app_resto/widgets/custom_price_filter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Filterscreen extends StatelessWidget {
  static const String routeName = '/filter';

  static Route route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => Filterscreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    // Assuming these are your lists of Price and Category objects
    List<Price> pricies = []; // populate this with your actual data
    List<Category> categories = []; // populate this with your actual data

    return Scaffold(
      appBar: AppBar(
        title: Text('Filter'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<FilterBloc, FiltersState>(builder: (context, state) {
                if (state is FiltersLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is FiltersLoaded) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      shape: RoundedRectangleBorder(),
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                    ),
                    child: Text('Aplly'),
                    onPressed: () {
                      // cette fonctionnalité retourne les categories et les pricies qui se trouve dans le fichier restaurant
                      var categories = state.filter.categoryFilters
                          .where((filter) => filter.value)
                          .map((filter) => filter.category.name)
                          .toList();
                      var pricies = state.filter.priceFilters
                          .where((filter) => filter.value)
                          .map((filter) => filter.price.price)
                          .toList();
                      List<Restaurant> restaurants = Restaurant.restaurants
                          .where(
                            (restaurant) => categories.any(
                              (category) => restaurant.tags.contains(category),
                            ),
                          )
                          .where(
                            (restaurant) => pricies.any(
                              (price) =>
                                  restaurant.priceCategory.contains(price),
                            ),
                          )
                          .toList();
                      Navigator.pushNamed(
                        context,
                        '/restaurant_listing',
                        arguments: restaurants,
                      );
                    },
                  );
                } else {
                  return Text('Something went wrong.');
                }
              }),
            ],
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Price',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).primaryColor)),
          CustomPriceFilter(),
          Text(
            'Category',
            style: Theme.of(context)
                .textTheme
                .headline4!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          CustomCategoryFilter(),
        ],
      ),
    );
  }
}
