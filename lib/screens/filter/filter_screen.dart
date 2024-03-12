import 'package:flutter/material.dart';
import 'package:flutter_app_resto/models/category_model.dart';
import 'package:flutter_app_resto/models/price_model.dart';
import 'package:flutter_app_resto/widgets/custom_category_filter.dart';
import 'package:flutter_app_resto/widgets/custom_price_filter.dart';

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



