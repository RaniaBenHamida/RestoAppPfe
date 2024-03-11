import 'package:flutter/material.dart';

class PromoBox extends StatelessWidget {
  const PromoBox({Key? key}); // Corrected the constructor syntax

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(right: 5.0),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Theme.of(context).primaryColor,
            image: DecorationImage(
              image: NetworkImage(
                'https://th.bing.com/th/id/OIP.oNJrYp3m1Z9VKn2LI0_mKwHaEK?rs=1&pid=ImgDetMain',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        // TODO: Create a custom clipper in the next episode
        Container(
          margin: const EdgeInsets.only(right: 5.0),
          width: MediaQuery.of(context).size.width - 40,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5.0),
            color: Theme.of(context).primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.only(
              top: 10.0,
              left: 15,
              right: 125,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'FREE Delivery on your First 3 Orders.',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.white),
                ),
                SizedBox(height: 15),
                Text(
                  'Place an order of \$10 or more and the delivery fee is on us',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
