import 'dart:math';

import 'package:lettutor/src/models/tutor.dart';

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
List<String> nationalities = [
  'Singaporean',
  'Malaysian',
  'Indonesian',
  'Thai',
  'Vietnamese',
  'Filipino',
  'Myanmar',
  'Cambodian',
  'Laotian',
  'Bruneian'
];
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

String randomNationality() {
  return nationalities[Random().nextInt(1000) % nationalities.length];
}

int maxSpecialties = 5;
int maxLanguages = 3;

List<Tutor> tutors = List.generate(10, (index) {
  return Tutor(
    id: index.toString(),
    name: randomName(),
    imageUrl: randomImageUrl(),
    bio: randomBio(),
    country: randomCountry(),
    specialties: Set.from(specialties.getRange(
        0, Random().nextInt(maxSpecialties) % specialties.length)),
    languages: Set.from(nationalities.getRange(
        0, Random().nextInt(maxLanguages) % nationalities.length)),
  );
});
