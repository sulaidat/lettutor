import 'package:lettutor/src/models/tutor.dart';
import 'package:flutter/foundation.dart';


class TutorList extends ChangeNotifier {
  List<Tutor> tutors = [];
  List<String> favorites = [];

  static TutorList? _instance;

  TutorList._internal();

  factory TutorList() {
    _instance ??= TutorList._internal();
    return _instance!;
  }

  void fetchTutors() {
    // TODO: Implement tutor fetching logic
  }

  void addToFavorites(String id) {
    favorites.add(id);
    notifyListeners();
  }

  void removeFromFavorites(String id) {
    favorites.remove(id);
    notifyListeners();
  }
}