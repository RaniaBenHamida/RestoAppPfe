import 'package:flutter/material.dart';
import 'package:flutter_app_resto/models/category_model.dart';

class CategoryBox extends StatelessWidget {
  final Category category;

  const CategoryBox({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            left: 10,
            child: Container(
              height: 50,
              width: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              child:
                  category.image, // Assuming category.image is a valid widget
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Text(
                category.name,
                style: Theme.of(context).textTheme.headline5!.copyWith(
                      color: Colors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
