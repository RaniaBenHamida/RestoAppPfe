import 'package:flutter/material.dart';
import 'package:flutter_app_resto/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:flutter_app_resto/blocs/autocomplete/autocomplete_state.dart';
import 'package:flutter_app_resto/blocs/geolocation/geolocation_bloc.dart';
import 'package:flutter_app_resto/blocs/geolocation/geolocation_state.dart';
import 'package:flutter_app_resto/blocs/place/place_bloc.dart';
import 'package:flutter_app_resto/blocs/place/place_event.dart';
import 'package:flutter_app_resto/blocs/place/place_state.dart';
import 'package:flutter_app_resto/widgets/gmap.dart';
import 'package:flutter_app_resto/widgets/location_search_box.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Locationscreen extends StatelessWidget {
  static const String routeName = '/location';

  static Route route() {
    return MaterialPageRoute(
      builder: (context) => Locationscreen(),
      settings: RouteSettings(name: routeName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlaceBloc, PlaceState>(builder: (context, State) {
        if (State is Placeloading) {
          return Stack(
            children: [
              BlocBuilder<GeolocationBloc, GeolocationState>(
                builder: (context, state) {
                  if (state is GeolocationLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is GeolocationLoaded) {
                    return Gmap(
                      lat: state.position.latitude,
                      lng: state.position.longitude,
                    );
                  } else {
                    return Text('Error');
                  }
                },
              ),
              SaveButton(),
              Location(),
            ],
          );
        } else if (State is Placeloaded) {
          return Stack(
            children: [
              Gmap(
                lat: State.place.lat,
                lng: State.place.lon,
              ),
              SaveButton(),
              Location(),
            ],
          );
        } else {
          return Text("Something went wrong");
        }
      }),
    );
  }
}

class Location extends StatelessWidget {
  const Location({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 20,
      left: 10,
      right: 10,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Theme.of(context).primaryColor,
          ),
          child: Text('save'),
          onPressed: () {
            // Ajouter la fonctionnalité pour le bouton de sauvegarde
          },
        ),
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  const SaveButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 10,
      right: 10,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/logo.svg', // Corrected path to SVG asset
                  height: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    children: [
                      LocationSearchBox(),
                      BlocBuilder<AutocompleteBloc, AutocompleteState>(
                        builder: (context, state) {
                          if (state is AutocompleteLoading) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else if (state is AutocompleteLoaded) {
                            return Container(
                              margin: const EdgeInsets.all(8.0),
                              height: 300,
                              color: state.autocomplete.length > 0
                                  ? Colors.black.withOpacity(0.5)
                                  : Colors.transparent,
                              child: ListView.builder(
                                itemCount: state.autocomplete.length,
                                itemBuilder: (context, index) {
                                  return ListTile(
                                    title: Text(
                                      state.autocomplete[index].description,
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                            color: Colors.white,
                                          ),
                                    ),
                                    onTap: () {
                                      context.read<PlaceBloc>().add(LoadPlace(
                                          placeId: state
                                              .autocomplete[index].placeId),
                                              );
                                    },
                                  );
                                },
                              ),
                            );
                          } else {
                            return Text('Something wont wrong');
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ), // Ajouté pour l'espacement
          ],
        ),
      ),
    );
  }
}
