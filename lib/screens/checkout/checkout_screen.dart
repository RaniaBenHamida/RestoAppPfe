import 'package:flutter/material.dart';

class CheckOutscreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => CheckOutscreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
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
