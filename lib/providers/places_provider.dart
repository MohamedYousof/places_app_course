import 'package:favplaces/models/place_model.dart';
import 'package:flutter/foundation.dart';

class PlacesProvider with ChangeNotifier {
  List<Place> _items = [];

  List<Place> get items {
    return [..._items];
  }
}
