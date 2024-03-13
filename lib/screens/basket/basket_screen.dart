
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Basketscreen extends StatelessWidget {
  static const String routeName = '/basket';

  static Route route() {
    return MaterialPageRoute(
      builder: (BuildContext context) => Basketscreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Basket'), actions: [IconButton(onPressed: () {},
           icon: Icon(Icons.edit),
          )
        ],
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
                  onPressed: () {},
                  child: Text('Go To checkout'),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  'Cutlery',
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Theme.of(context).primaryColor),
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Row(
                  children: [
                    Text(
                      'Do you need cutlery',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    SizedBox(
                      width: 100,
                      child: SwitchListTile(
                        value: false,
                        onChanged: (bool? newValue) {},
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                'items',
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(color: Theme.of(context).primaryColor),
              ),
              ListView.builder(
                shrinkWrap: true,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '1x',
                            style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).primaryColor),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            child: Text(
                              'Pizza Margherita',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ),
                          Text(
                            '\$4.99',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                    );
                  }),
                  Container(
                    width: double.infinity,
                    height: 100,
                     margin: const EdgeInsets.only(top: 5),
                     padding:
                    const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/delivery_tmies.png'),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Text('Delivery in 20 minutes', style: Theme.of(context).textTheme.headline6,
                          ),
                          TextButton(onPressed: () {},
                           child:  Text(
                            'Change',
                            style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).primaryColor),
                          ), ),
                          ],
                        )
                      ],
                    ),
                 ),
            
             Container(
                    width: double.infinity,
                    height: 100,
                     margin: const EdgeInsets.only(top: 5),
                     padding:
                    const EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 20),
                            Text('Do you have a voucher?',
                             style: Theme.of(context).textTheme.headline6,
                          ),
                          TextButton(onPressed: () {},
                           child:  Text(
                            'Apply',
                            style: Theme.of(context).textTheme.headline6!.copyWith(color: Theme.of(context).primaryColor),
                          ), ),
                          ],
                        ),
                         SvgPicture.asset('assets/voucher'),
                      ],
                    ),
                 ),
                  Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Subtotal', 
                              style: Theme.of(context).textTheme.headline6,
                            ),
                             Text(
                            '\$20.0',
                             style: Theme.of(context).textTheme.headline6,
                            ),
                            ],
                          ),
                          SizedBox(height: 5),
                          Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                           Text(
                          'Delivery fee',
                          style: Theme.of(context).textTheme.headline6,
                              ),
                          Text(
                          '\$5.0',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                     SizedBox(height: 5),
                        Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text(
                          'Total',
                          style: Theme.of(context).textTheme.headline5!
                          .copyWith(color: Theme.of(context)
                          .primaryColor),
                        ),
                        Text(
                          '\$25.0',
                          style: Theme.of(context).textTheme.headline5!
                          .copyWith(color: Theme.of(context)
                          .primaryColor),
                        ),
                      ],
                    )
                        ],
                      ),
                    ),
            ],
          ),
        ));
  }
}
