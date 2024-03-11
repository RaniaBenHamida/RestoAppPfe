import 'package:equatable/equatable.dart';

class Promo extends Equatable {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  Promo({
    required this.id,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        imageUrl,
      ];
  static List<Promo> promos = [
    Promo(
        id: 1,
        title: 'FREE Delevry on Your first 3 orders.',
        description: 'Place an order of\$10 or more, and the delevery',
        imageUrl:
            'https://media.istockphoto.com/id/1134086311/photo/chinese-take-away-boxes.jpg?s=1024x1024&w=is&k=20&c=mnVQyNHIeC6M7PPTpx5nEH7fRgFlWcWOHpbnAgS_esg='),
    Promo(
        id: 2,
        title: '%20 off on Selected Restaurants.',
        description: 'Get a discount at more than 200+ restaurants',
        imageUrl: 'https://www.istockphoto.com/photo/view-through-the-window-of-staff-and-customers-inside-buns-and-buns-restaurant-in-gm1178591496-329480747',
      ),
  ];
}
