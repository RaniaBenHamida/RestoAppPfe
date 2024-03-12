import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_resto/models/restaurant_model.dart';
import 'package:flutter_app_resto/widgets/restaurant_card.dart';

// cette fonctionnaliyés affiches les listes de rerstaurants
class RestaurantListingScreen extends StatelessWidget {
  static const String routeName = '/restaurant_listing';

  static Route route({required List<Restaurant> restaurants, required List<Restaurant> restaurant}) {
    return MaterialPageRoute(
      builder: (BuildContext context) =>
          RestaurantListingScreen(restaurants: restaurants),
      settings: RouteSettings(name: routeName),
    );
  }

  final List<Restaurant> restaurants;
  const RestaurantListingScreen({
    required this.restaurants,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Restaurants'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
              itemCount: restaurants.length,
              itemBuilder: (context, builder) {
                // y'a une erreur ici 
                return RestaurantCard(restaurant: restaurants[Index]);
              }),
        ));
  }
}
