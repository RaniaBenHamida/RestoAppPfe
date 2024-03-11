import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final name;
  final String description;
  final double price;

  MenuItem(
      {required this.id,
      required this.restaurantId,
      required this.name,
      required this.description,
      required this.price});

  @override
  // TODO: implement props
  List<Object?> get props => [
        id,
        restaurantId,
        description,
        price,
      ];

  static List<MenuItem> menuItems = [
  MenuItem(id: 1,
 restaurantId: 1, 
 name: 'Pizza',
  description: 'Pizza with Tomatoes',
  price: 15.50),
   MenuItem(id: 2,
 restaurantId: 1, 
 name: 'Coca Cola',
  description: 'A cold beverage',
  price: 3.50),
  ];

}
