import 'package:flutter/material.dart';

class RestaurantListingScreen extends StatelessWidget {
  static const String routeName = '/restaurant_listing';

  static Route route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => RestaurantListingScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RestaurantListing'),
      ),
      body: ElevatedButton(
        child: Text('Home screen'),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
    );
  }
}
