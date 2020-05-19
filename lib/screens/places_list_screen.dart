import 'package:favplaces/providers/places_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import 'add_place_screen.dart';

class PlacesListScreen extends StatelessWidget {
  static const routeName = 'Places-list-screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          )
        ],
      ),
      body: Consumer<PlacesProvider>(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('No places yet, start adding some'),
              SizedBox(
                height: 5,
              ),
              FlatButton.icon(
                  onPressed: () =>
                      Navigator.of(context).pushNamed(AddPlaceScreen.routeName),
                  icon: Icon(Icons.add),
                  label: Text('Add new place'))
            ],
          ),
        ),
        builder: (context, data, child) => data.items.length == 0
            ? child
            : ListView.builder(
                itemCount: data.items.length,
                itemBuilder: (context, i) => ListTile(
                  leading: CircleAvatar(
                    backgroundImage: FileImage(data.items[i].image),
                  ),
                  title: Text(
                    data.items[i].title,
                  ),
                ),
              ),
      ),
    );
  }
}
