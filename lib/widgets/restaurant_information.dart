import 'package:flutter/material.dart';
import 'package:flutter_app_resto/models/restaurant_model.dart';
import 'package:flutter_app_resto/widgets/widgets.dart';

class RestaurantInformation extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantInformation({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            restaurant.name,
            style: Theme.of(context)
                .textTheme
                .headline3!
                .copyWith(color: Theme.of(context).primaryColor),
          ),
          SizedBox(height: 10),
          RestaurantTags(restaurant: restaurant),
          SizedBox(height: 5),
          Text(
            '${restaurant.distance}km away -\$${restaurant.deliveryFree} delevery fee',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          SizedBox(height: 10),
           Text(
            'Restaurant Information',
            style: Theme.of(context).textTheme.headline5!,
          ),
          SizedBox(height: 5),
          Text(
            'Ideoque erat vel peremptae quas permissa altera inmane hoc conplures inmane participes sufficiens retinere participes.',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
