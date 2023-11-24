import 'package:flutter/material.dart';

class SearchFilter with ChangeNotifier {
  Set<String> _nationalities = {};
  Set<String> _specialties = {};
  String _name = '';

  Set<String> get nationalities => _nationalities;
  Set<String> get specialties => _specialties;
  String get name => _name;

  set nationalities(Set<String> value) {
    _nationalities = value;
    notifyListeners();
  }

  set specialties(Set<String> value) {
    _specialties = value;
    notifyListeners();
  }

  set name(String value) {
    _name = value;
    notifyListeners();
  }

  void addNationality(String s) {
    if (!_nationalities.contains(s)) {
      _nationalities.add(s);
      notifyListeners();
    }
  }

  void removeNationality(String s) {
    if (_nationalities.contains(s)) {
      _nationalities.remove(s);
      notifyListeners();
    }
  }

  void addSpecialty(String s) {
    if (!_specialties.contains(s)) {
      _specialties.add(s);
      notifyListeners();
    }
  }

  void removeSpecialty(String s) {
    if (_specialties.contains(s)) {
      _specialties.remove(s);
      notifyListeners();
    }
  }
}
