import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Homescreen extends StatelessWidget {
  static const String routeName = '/';

  static Route route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => Homescreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: SvgPicture.asset('asset/logo.svg', 
        height: 100,
        )
      ),
    );
  }
}
