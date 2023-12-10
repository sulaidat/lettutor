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

  bool isFavorite(String id) {
    return favorites.contains(id);
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

  void sortByFavorite() {
    displayedTutors.sort((a, b) {
      if (favorites.contains(a.id) && !favorites.contains(b.id)) {
        return -1;
      } else if (!favorites.contains(a.id) && favorites.contains(b.id)) {
        return 1;
      } else {
        return 0;
      }
    });
    // print("Favorites: $favorites");
    // print("Display: ${displayedTutors.map((e) => e.id)}");
  }

  void sortByRating() {
    displayedTutors.sort((a, b) {
      if (a.rating! > b.rating!) {
        return -1;
      } else if (a.rating! < b.rating!) {
        return 1;
      } else {
        return 0;
      }
    });
  }

  void sortBy(String sort) {
    switch (sort) {
      case 'Favorite':
        sortByFavorite();
        break;
      case 'Rating':
        sortByRating();
        break;
      default:
        break;
    }
  }

  Tutor getTutorById(String id) {
    return tutors.firstWhere((tutor) => tutor.id == id);
  }

  void reportTutor(String tutorId, List<String> violations) {
    // TODO: print for now, implement later
    print("Report tutor $tutorId for violations: $violations");
  }
}
