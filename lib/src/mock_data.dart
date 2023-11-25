import 'dart:math';

import 'package:lettutor/src/models/tutor.dart';
import 'package:lettutor/src/models/tutor_list.dart';

List<String> firstNames = [
  'John',
  'Jane',
  'Robert',
  'Emily',
  'Michael',
  'Sarah',
  'James',
  'Jessica',
  'David',
  'Ashley'
];
List<String> lastNames = [
  'Smith',
  'Johnson',
  'Williams',
  'Brown',
  'Jones',
  'Miller',
  'Davis',
  'Garcia',
  'Rodriguez',
  'Wilson'
];
List<String> bios = [
  'Experienced tutor with a passion for teaching.',
  'Dedicated and patient tutor with over 5 years of experience.',
  'Enthusiastic tutor who loves helping students succeed.',
  'Knowledgeable tutor with a knack for making complex topics easy to understand.',
  'Friendly tutor who believes in the power of positive reinforcement.',
  'Motivated tutor with a unique approach to teaching.',
  'Passionate tutor who is dedicated to student success.',
  'Experienced tutor who focuses on the individual needs of each student.',
  'Patient and understanding tutor with a love for teaching.',
  'Dedicated tutor who works hard to help students understand complex concepts.',
  'Enthusiastic tutor who is always looking for new ways to help students learn.',
  'Knowledgeable tutor with a comprehensive understanding of various teaching methods.',
  'Friendly and approachable tutor with a dedication to student success.',
  'Motivated tutor who strives to create a positive learning environment.',
  'Passionate tutor who is committed to helping students succeed in their studies.',
  'Experienced tutor who understands the challenges students face when learning new topics.',
  'Patient tutor who takes the time to explain concepts in a way that students can understand.',
  'Understanding tutor who works with students to find the best learning methods for them.',
  'Dedicated tutor who is always looking for new ways to engage students in learning.',
  'Enthusiastic tutor who is passionate about helping students achieve their academic goals.'
];
List<String> countries = [
  'Singapore',
  'Malaysia',
  'Indonesia',
  'Thailand',
  'Vietnam',
  'Philippines',
  'Myanmar',
  'Cambodia',
  'Laos',
  'Brunei'
];
Map<String, String> nationalities = {
  'Singapore': 'Singaporean',
  'Malaysia': 'Malaysian',
  'Indonesia': 'Indonesian',
  'Thailand': 'Thai',
  'Vietnam': 'Vietnamese',
  'Philippines': 'Filipino',
  'Myanmar': 'Myanmar',
  'Cambodia': 'Cambodian',
  'Laos': 'Laotian',
  'Brunei': 'Bruneian'
};

List<String> specialties = [
  'Mathematics',
  'Physics',
  'Chemistry',
  'Biology',
  'English',
  'Chinese',
  'Malay',
  'Tamil',
  'History',
  'Geography'
];

List<String> languages = [
  'English',
  'Chinese',
  'Malay',
  'Tamil',
  'Spanish',
  'French',
  'German',
  'Japanese',
  'Korean',
  'Hindi'
];

String randomName() {
  String firstName = firstNames[Random().nextInt(1000) % firstNames.length];
  String lastName = lastNames[Random().nextInt(100) % lastNames.length];
  return '$firstName $lastName';
}

String randomImageUrl() {
  final randomId = Random().nextInt(20);
  return 'https://randomuser.me/api/portraits/men/$randomId.jpg';
}

String randomBio() {
  return bios[Random().nextInt(1000) % bios.length];
}

String randomCountry() {
  return countries[Random().nextInt(1000) % countries.length];
}

int maxSpecialties = 5;
int maxLanguages = 3;

List<Tutor> tutors = List.generate(20, (index) {
  var country = randomCountry();
  return Tutor(
    id: index.toString(),
    name: randomName(),
    imageUrl: randomImageUrl(),
    bio: randomBio(),
    country: country,
    nationality: nationalities[country],
    specialties: Set.from(specialties.getRange(
        0, 1 + Random().nextInt(maxSpecialties - 1) % specialties.length)),
    languages: Set.from(languages.getRange(
        0, 1 + Random().nextInt(maxLanguages - 1) % languages.length)),
    rating: Random().nextDouble() * 5,  // TODO: calculate rating from reviews later
  );
});
