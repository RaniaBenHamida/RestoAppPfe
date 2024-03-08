import 'package:flutter/material.dart';

class DeliveryTimeScreen extends StatelessWidget {
  static const String routeName = '/delivery_time';

  static Route route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => DeliveryTimeScreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DeliveryTime'),
      ),
      body: ElevatedButton(
        child: Text('Home Screen'),
        onPressed: () {
          Navigator.pushNamed(context, '/');
        },
      ),
    );
  }
}
