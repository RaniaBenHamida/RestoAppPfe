import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app_resto/models/category_model.dart';
import 'package:flutter_app_resto/models/restaurant_model.dart';
import 'package:flutter_app_resto/widgets/category_box.dart';
import 'package:flutter_app_resto/widgets/promo_box.dart';
import 'package:flutter_app_resto/widgets/widgets.dart';

class Homescreen extends StatelessWidget {
  static const String routeName = '/home';

  static Route route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => Homescreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: CustomAppBar(), // You need to define CustomAppBar
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 100,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount:
                      Category.Categories.length, // Corrected capitalization
                  itemBuilder: (context, index) {
                    // This method returns the CategoryBox
                    return CategoryBox(Category.Categories[index]);
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                height: 125,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    // You need to return a widget here (e.g., PromoBox)
                    return PromoBox(); // Placeholder for PromoBox
                  },
                ),
              ),
            ),
            FoodSearchBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Top Read',
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
                itemCount: Restaurant.restaurants.length,
                itemBuilder: (context, index) {
                  return RestaurantCard(
                      restaurant: Restaurant.restaurants[index]);
                })
          ],
        ),
      ),
    );
  }
}
class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;

  const RestaurantCard({Key? key, required this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  image: DecorationImage(
                    image: NetworkImage(restaurant.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 60,
                  height: 30,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${restaurant.deliveryTime} min',
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(restaurant.name, style: Theme.of(context).textTheme.headline5),
              SizedBox(height: 5),
            Row(
              children: 
              restaurant.tags.map((tag) => restaurant.tags.indexOf(tag)== restaurant.tags.length -1
              ? Text(tag, 
                style: Theme.of(context).textTheme.bodyText1,)
              : Text('$tag ', 
                style: Theme.of(context).textTheme.bodyText1,),
              )
              .toList()
            ),
              SizedBox(height: 5),
              Text('${restaurant.distance} km - \$${restaurant.deliveryFree} delevery free',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
            ],),
          )
        ],
      ),
    );
  }
}

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: Icon(Icons.person),
        onPressed: () {},
      ),
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'CURRENT LOCATION',
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: Colors.white),
          ),
          Text(
            'Singapore, 1 shenton way',
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(color: Colors.white),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
