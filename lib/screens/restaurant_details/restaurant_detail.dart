import 'package:flutter/material.dart';
import 'package:flutter_app_resto/blocs/basket/basket_bloc.dart';
import 'package:flutter_app_resto/blocs/basket/basket_event.dart';
import 'package:flutter_app_resto/blocs/basket/basket_state.dart';
import 'package:flutter_app_resto/models/models.dart';
import 'package:flutter_app_resto/models/restaurant_model.dart';
import 'package:flutter_app_resto/widgets/restaurant_information.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RestaurantDetailsScreen extends StatelessWidget {
  static const String routeName = '/restaurant_details';

  static Route route({required Restaurant restaurant}) {
    return MaterialPageRoute(
      builder: (BuildContext context) =>
          RestaurantDetailsScreen(restaurant: restaurant),
      settings: RouteSettings(name: routeName),
    );
  }

  final Restaurant restaurant;
  const RestaurantDetailsScreen({required this.restaurant});
  @override
  Widget build(BuildContext context) {
    Restaurant restaurant = Restaurant.restaurants[0];
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(),
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, '/basket');
                  },
                  child: Text('Basket'),
                ),
              ],
            ),
          ),
        ),
        extendBodyBehindAppBar: true,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 250,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(
                          MediaQuery.of(context).size.width, 50),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(restaurant.imageUrl),
                    )),
              ),
              RestaurantInformation(restaurant: restaurant),
              ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: restaurant.tags.length,
                  itemBuilder: (context, index) {
                    return buildMenuItems(restaurant, context, index);
                  })
            ],
          ),
        ));
  }

  Widget buildMenuItems(restaurant, BuildContext context, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            restaurant.tags[index],
            style: Theme.of(context).textTheme.headline3!.copyWith(
                  color: Theme.of(context).primaryColor,
                ),
          ),
        ),
        Column(
          children: restaurant.menuItems
              .where((item) => item.Category == restaurant.tags[index])
              .map<Widget>((item) => Column(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListTile(
                          dense: true,
                          // y'a une petite erreur ici parce que contentpadding est souligné
                          contentPadding: EdgeInsets.zero,
                          title: Text(
                            item.name,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                          subtitle: Text(
                            item.description,
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                          trailing: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('\$${item.price}',
                                  style: Theme.of(context).textTheme.bodyText1),
                              BlocBuilder<BasketBloc, BasketState>(
                                  builder: (context, state) {
                                return IconButton(
                                  onPressed: () {
                                    context.read<BasketBloc>()
                                      ..add(AddItem(item));
                                  },
                                  // ici tu dois mettre accentColor au lieu de primaryColor mais impossible !!!
                                  icon: Icon(
                                    Icons.add_circle,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                );
                              }),
                            ],
                          ),
                        ),
                      ),
                      Divider(
                        height: 2,
                      ),
                    ],
                  ))
              .toList(),
        ),
      ],
    );
  }
}
