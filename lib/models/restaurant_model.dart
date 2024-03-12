import 'package:equatable/equatable.dart';
import 'package:flutter_app_resto/models/menu_item_model.dart';

class Restaurant extends Equatable {
  final int id;
  final String imageUrl;
  final String name;
  final List<String> tags;
  final List<MenuItem> menuItems;
  final int deliveryTime;
  final double deliveryFree;
  final double distance;

  Restaurant({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.tags,
    required this.menuItems,
    required this.deliveryTime,
    required this.deliveryFree,
    required this.distance,
  });

  @override
  List<Object?> get props => [
        id,
        imageUrl,
        name,
        tags,
        menuItems,
        deliveryTime,
        deliveryFree,
        distance,
      ];

  static List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      name: 'Golden Ice Gelato Artigianale',
      imageUrl:
          'https://th.bing.com/th/id/R.01f0767ff0abfdbc9b6542010630b34e?rik=AV9R%2bcQRx4CAzw&pid=ImgRaw&r=0',
      tags: MenuItem.menuItems
          .where((item) => item.restaurantId == 1)
          .map((item) => item.category)
          .toSet()
          .toList(),
      menuItems:
          MenuItem.menuItems.where((item) => item.restaurantId == 1).toList(),
      deliveryTime: 30,
      deliveryFree: 2.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 2,
      name: 'Golden Ice Gelato Artigianale',
      imageUrl:
          'https://fenixhotel.it/wp-content/uploads/2020/03/miglior_gelato_artigianale_a_roma.jpg',
      tags: MenuItem.menuItems
          .where((item) => item.restaurantId == 2)
          .map((item) => item.category)
          .toSet()
          .toList(),
      menuItems:
          MenuItem.menuItems.where((item) => item.restaurantId == 2).toList(),
      deliveryTime: 30,
      deliveryFree: 2.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 3,
      name: 'Golden Ice Gelato Artigianale',
      imageUrl:
          'https://th.bing.com/th/id/R.9e51f1be1f879a30579bcc731d5fc84c?rik=L2CCb3MvGoK6Dg&pid=ImgRaw&r=0',
      tags: MenuItem.menuItems
            .where((item) => item.restaurantId == 3)
            .map((item) => item.category)
            .toSet()
            .toList(),
      menuItems:
          MenuItem.menuItems.where((item) => item.restaurantId == 3).toList(),
      deliveryTime: 30,
      deliveryFree: 2.99,
      distance: 0.1,
    ),
    Restaurant(
      id: 4,
      name: 'Golden Ice Gelato Artigianale',
      imageUrl: 'https://i.blogs.es/921363/polos-frutas/500_500.jpg',
      tags: MenuItem.menuItems
          .where((item) => item.restaurantId == 4)
          .map((item) => item.category)
          .toSet()
          .toList(),
      menuItems:
          MenuItem.menuItems.where((item) => item.restaurantId == 4).toList(),
      deliveryTime: 30,
      deliveryFree: 2.99,
      distance: 0.1,
    ),
  ];
}
