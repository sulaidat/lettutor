import 'package:lettutor/src/models/tutor.dart';
import 'package:flutter/foundation.dart';

class TutorList extends ChangeNotifier {
  List<Tutor> tutors = [];
  List<String> favorites = [];
  List<Tutor> displayedTutors = [];

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

  void filterByName(String name) {
    displayedTutors =
        displayedTutors.where((tutor) => tutor.name!.contains(name)).toList();
  }

// AND filter
  void filterBySpecialty(List<String> specialties) {
    for (var specialty in specialties) {
      displayedTutors = displayedTutors
          .where((tutor) => tutor.specialties!.contains(specialty))
          .toList();
    }
  }

// OR filter
  void filtelByNationalities(List<String> nationalities) {
    displayedTutors = displayedTutors.where((tutor) {
      if (nationalities.contains(tutor.nationality)) {
        return true;
      }
      return false;
    }).toList();
  }

  Set<String> getSpecialties() {
    Set<String> specialties = {};
    for (var tutor in tutors) {
      specialties.addAll(tutor.specialties!);
    }
    return specialties;
  }

  Set<String> getNationalities() {
    Set<String> nationalities = {};
    for (var tutor in tutors) {
      nationalities.add(tutor.nationality!);
    }
    return nationalities;
  }
}
