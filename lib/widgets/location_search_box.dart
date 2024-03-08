import 'package:flutter/material.dart';
import 'package:flutter_app_resto/blocs/autocomplete/autocomplete_bloc.dart';
import 'package:flutter_app_resto/blocs/autocomplete/autocomplete_event.dart';
import 'package:flutter_app_resto/blocs/autocomplete/autocomplete_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationSearchBox extends StatelessWidget {
  const LocationSearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AutocompleteBloc, AutocompleteState>(
      builder: (context, state) {
        if (state is AutocompleteLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is AutocompleteLoaded) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Enter your Location',
                suffixIcon: Icon(Icons.search),
                contentPadding:
                    const EdgeInsets.only(left: 20.0, bottom: 5.0, top: 5.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                context
                    .read<AutocompleteBloc>()
                    .add(LoadedAutocomplete(searchInput: value));
              },
            ),
          );
        } else {
          return Text('Something went wrong.');
        }
      },
    );
  }
}
