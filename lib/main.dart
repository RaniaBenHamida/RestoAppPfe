import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_app_resto/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:flutter_app_resto/blocs/autocomplete/autocomplete_event.dart';
import 'package:flutter_app_resto/blocs/basket/basket_bloc.dart';
import 'package:flutter_app_resto/blocs/basket/basket_event.dart';
import 'package:flutter_app_resto/blocs/filters/filters_bloc.dart';
import 'package:flutter_app_resto/blocs/filters/filters_event.dart';
import 'package:flutter_app_resto/blocs/geolocation/geolocation_bloc.dart';
import 'package:flutter_app_resto/blocs/geolocation/geolocation_event.dart';
import 'package:flutter_app_resto/blocs/place/place_bloc.dart';
import 'package:flutter_app_resto/config/app_router.dart';
import 'package:flutter_app_resto/config/theme.dart';
import 'package:flutter_app_resto/firebase_options.dart';
import 'package:flutter_app_resto/repositories/geolocalisation/geolocation_repository.dart';
import 'package:flutter_app_resto/repositories/places/place_repository.dart';
import 'package:flutter_app_resto/screens/restaurant_listing/restaurant_listing_screen.dart';
import 'package:flutter_app_resto/simple_bloc_observer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // Initialize Firebase first
 BlocOverrides.runZoned(
    () {
      runApp(MyApp());
    },
    blocObserver: SimpleBlocObserver(), // Provide your bloc observer here if needed
  );
}



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<GeolocationRepository>(
          create: (context) => GeolocationRepository(),
        ),
        RepositoryProvider<PlaceRepository>(
          create: (context) => PlaceRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
              create: (context) => GeolocationBloc(
                  geolocationRepository: context.read<GeolocationRepository>())
                ..add(LoadGeolocation())),
          BlocProvider(
              create: (context) => AutocompleteBloc(
                  placeRepository: context.read<PlaceRepository>())
                ..add(LoadedAutocomplete())),


                BlocProvider(
              create: (context) => PlaceBloc(
                  placeRepository: context.read<PlaceRepository>())
                ),
          BlocProvider(create: (context) => FilterBloc()..add(LoadedFilter()),
          ),
          BlocProvider(create: (context) => BasketBloc()..add(StartBasket(),
          ),
          )
        ],
        
        child: MaterialApp(
          title: 'FoodDelivery',
          debugShowCheckedModeBanner: false,
          theme: theme(),
          onGenerateRoute: AppRouter.onGenerateRoute,
          initialRoute: RestaurantListingScreen.routeName,
        ),
      ),
    );
  }
}
