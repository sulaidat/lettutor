import 'package:flutter/foundation.dart';

class TutorInfo with ChangeNotifier {
  Set<String> _availNationalities = {};
  Set<String> _availSpecialities = {};

  Set<String> get availNationalities => _availNationalities;
  Set<String> get availSpecialities => _availSpecialities;

  set availNationalities(Set<String> nationalities) {
    _availNationalities = nationalities;
    notifyListeners();
  }

  set availSpecialities(Set<String> specialities) {
    _availSpecialities = specialities;
    notifyListeners();
  }
}