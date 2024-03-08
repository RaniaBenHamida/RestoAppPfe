import 'package:flutter/material.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const String routeName = '/restaurant_details';

  static Route route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => RestaurantDetailsScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RestaurantDetails'),
      ),
      body: ElevatedButton(
        child: Text('Home Screen'),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
    );
  }
}
