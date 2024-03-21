import 'package:equatable/equatable.dart';

class MenuItem extends Equatable {
  final int id;
  final int restaurantId;
  final String description;
  final double price;
  final String name;
  final String category;

  MenuItem(
      {required this.id,
      required this.restaurantId,
      required this.name,
      required this.category,
      required this.description,
      required this.price});

  @override
  List<Object?> get props => [
        id,
        name,
        category,
        restaurantId,
        description,
        price,
      ];

  static List<MenuItem> menuItems = [
    MenuItem(
        id: 1,
        restaurantId: 1,
        name: '4 Formaggi',
        category: 'Pizza',
        description: 'Tomate, mozzarella, basil',
        price: 10.50),
    MenuItem(
        id: 1,
        restaurantId: 1,
        name: 'Margherita',
        category: 'Pizza',
        description: 'Tomate, mozzarella, basil',
        price: 10.50),
    MenuItem(
        id: 1,
        restaurantId: 1,
        name: 'Baviera',
        category: 'Pizza',
        description: 'Tomate, mozzarella, basil',
        price: 10.50),
    MenuItem(
        id: 1,
        restaurantId: 1,
        name: 'Coca Cola',
        category: 'Pizza',
        description: ' A Fresh Drink',
        price: 4.50),
  ];
}
