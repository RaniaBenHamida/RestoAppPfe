import 'package:flutter/material.dart';
import 'package:flutter_app_resto/screens/basket/basket_screen.dart';
import 'package:flutter_app_resto/screens/checkout/checkout_screen.dart';
import 'package:flutter_app_resto/screens/delivery_time/delivery_time_screen.dart';
import 'package:flutter_app_resto/screens/filter/filter_screen.dart';
import 'package:flutter_app_resto/screens/home/home_screen.dart';
import 'package:flutter_app_resto/screens/location/location_screen.dart';
import 'package:flutter_app_resto/screens/restaurant_details/restaurant_detail.dart';
import 'package:flutter_app_resto/screens/restaurant_listing/restaurant_listing_screen.dart';
import 'package:flutter_app_resto/screens/voucher/voucher_screen.dart';

class AppRouter {
  static Route onGenerateRoute(RouteSettings settings) {
    print('The Route is :${settings.name}');

    switch (settings.name) {
      case '/':
        return Homescreen.route();
      case Homescreen.routeName:
        return Homescreen.route();
      case Locationscreen.routeName:
        return Locationscreen.route();
      case Basketscreen.routeName:
        return Basketscreen.route();
      case CheckOutscreen.routeName:
        return CheckOutscreen.route();
      case DeliveryTimeScreen.routeName:
        return DeliveryTimeScreen.route();
      case Filterscreen.routeName:
        return Filterscreen.route();
      case RestaurantDetailsScreen.routeName:
        return RestaurantDetailsScreen.route();
      case RestaurantListingScreen.routeName:
        return RestaurantListingScreen.route();
      case CheckOutscreen.routeName:
        return CheckOutscreen.route();
      case VoucherScreen.routeName:
        return VoucherScreen.route();
      
      default:
        return _errorRoute();
    }
  }

  static Route _errorRoute() {
    return MaterialPageRoute(
      builder: (BuildContext context) =>
          Scaffold(appBar: AppBar(title: Text('error'))),
    );
  }
}
