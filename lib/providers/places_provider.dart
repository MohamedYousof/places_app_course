import 'dart:io';

import 'package:favplaces/helpers/dbhelper.dart';
import 'package:favplaces/models/place_model.dart';
import 'package:flutter/foundation.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }

  void addPlace(String pickedTitle, File pickedImage) {
    final newPlace = Place(
      id: DateTime.now().toString(),
      title: pickedTitle,
      image: pickedImage,
      location: null,
    );
    _items.add(newPlace);
    notifyListeners();
    final data = {
      'id': newPlace.id,
      'title': newPlace.title,
      'image': newPlace.image.path,
    };
    DBHelper.insert('user_places', data);
  }

  Future<void> getAndFetchData() async {
    final data = await DBHelper.getData('user_places');
    _items = data
        .map(
          (i) => Place(
              id: i['id'],
              title: i['title'],
              image: File(i['image']),
              location: null),
        )
        .toList();
    notifyListeners();
  }
}
