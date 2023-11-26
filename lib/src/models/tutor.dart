import 'package:flutter/foundation.dart';
import 'package:lettutor/src/models/review.dart';

class Tutor with ChangeNotifier {
  String id;
  String? name;
  String? imageUrl;
  String? introVideoUrl;
  String? bio;
  String? country;
  String? nationality;
  Set<String>? specialties;
  Set<String>? languages;
  double? rating;
  String? education;
  String? teachingExperience;
  String? interests;
  List<Review>? reviews;

  Tutor({
    required this.id,
    this.name,
    this.imageUrl,
    this.introVideoUrl,
    this.bio,
    this.country,
    this.nationality,
    this.specialties,
    this.languages,
    this.rating,
    this.education,
    this.teachingExperience,
    this.interests,
    this.reviews,
  });

  void updateName(String newName) {
    name = newName;
    notifyListeners();
  }

  void updateImageUrl(String newImageUrl) {
    imageUrl = newImageUrl;
    notifyListeners();
  }

  void updateIntroVideoUrl(String newIntroVideoUrl) {
    introVideoUrl = newIntroVideoUrl;
    notifyListeners();
  }

  void updateBio(String newBio) {
    bio = newBio;
    notifyListeners();
  }

  void updateCountry(String newCountry) {
    country = newCountry;
    notifyListeners();
  }

  void addSpeciality(String speciality) {
    specialties?.add(speciality);
    notifyListeners();
  }

  void removeSpeciality(String speciality) {
    specialties?.remove(speciality);
    notifyListeners();
  }

  void addLanguage(String language) {
    languages?.add(language);
    notifyListeners();
  }

  void removeLanguage(String language) {
    languages?.remove(language);
    notifyListeners();
  }
}
