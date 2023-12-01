import 'dart:math';

import 'package:lettutor/src/models/lesson.dart';
import 'package:lettutor/src/models/review.dart';
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
List<String> name = [
  'Robert Jones',
  'Sarah Miller',
  'Jessica Johnson',
  'John Williams',
  'John Johnson',
  'John Wilson',
  'Sarah Brown',
  'David Brown',
  'Michael Rodriguez',
  'Emily Williams',
  'Sarah Jones',
  'David Rodriguez',
  'Robert Miller',
  'Emily Rodriguez',
  'Emily Garcia',
  'Ashley Jones',
  'Jane Garcia',
  'Robert Garcia',
  'Jane Smith',
  'Jane Johnson'
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

List<String> educations = [
  'Bachelor of Science in Computer Science',
  'Master of Science in Data Science',
  'Bachelor of Arts in Graphic Design',
  'Master of Business Administration',
  'Bachelor of Science in Mechanical Engineering',
  'Doctor of Philosophy in Physics',
  'Bachelor of Arts in English Literature',
  'Master of Science in Cybersecurity',
  'Bachelor of Science in Biology',
  'Doctor of Medicine',
  // add more as needed
];

List<String> teachingExperiences = [
  '2 years of teaching Computer Science at XYZ University',
  '5 years of teaching Data Science at ABC Institute',
  '1 year of teaching Graphic Design at DEF College',
  '3 years of teaching Business Administration at GHI University',
  '4 years of teaching Mechanical Engineering at JKL Institute',
  '6 years of teaching Physics at MNO College',
  '2 years of teaching English Literature at PQR University',
  '5 years of teaching Cybersecurity at STU Institute',
  '3 years of teaching Biology at VWX College',
  '4 years of teaching Medicine at YZ University',
  // add more as needed
];

List<String> interests = [
  'Reading',
  'Traveling',
  'Cooking',
  'Hiking',
  'Photography',
  'Music',
  'Painting',
  'Gardening',
  'Coding',
  'Gaming',
  // add more as needed
];

List<String> violations = [
  'No-show',
  'Late',
  'Inappropriate behavior',
  'Spam',
  'Scam or fraud',
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

String randomEducation() {
  return educations[Random().nextInt(1000) % educations.length];
}

String randomTeachingExperience() {
  return teachingExperiences[
      Random().nextInt(1000) % teachingExperiences.length];
}

String randomInterests() {
  return interests[Random().nextInt(1000) % interests.length];
}

List<Review> generateMockReviews() {
  return List<Review>.generate(10, (index) {
    return Review(
        id: 'id$index',
        name: 'Reviewer $index',
        review: 'This is a review from Reviewer $index.',
        rating: (Random().nextDouble() * 4) +
            1, // generate a random rating between 1 and 5
        date: DateTime.now().subtract(Duration(
            days: Random().nextInt(1000) %
                365)) // generate a random date between now and 1 year ago
        );
  });
}

int maxSpecialties = 5;
int maxLanguages = 3;

List<Tutor> tutors = List.generate(20, (index) {
  var country = randomCountry();
  return Tutor(
    id: index.toString(),
    name: name[index],
    imageUrl: 'https://randomuser.me/api/portraits/men/$index.jpg',
    // imageUrl: 'assets/imgs/tutors/${index % 20}.jpg',
    bio: randomBio(),
    country: country,
    nationality: nationalities[country],
    specialties: Set.from(specialties.getRange(
        0, 1 + Random().nextInt(maxSpecialties - 1) % specialties.length)),
    languages: Set.from(languages.getRange(
        0, 1 + Random().nextInt(maxLanguages - 1) % languages.length)),
    rating:
        Random().nextDouble() * 5, // TODO: calculate rating from reviews later
    education: randomEducation(),
    teachingExperience: randomTeachingExperience(),
    interests: randomInterests(),
    reviews: generateMockReviews(),
  );
});

List<Lesson> lessons = List.generate(tutors.length*2, (index) {
  return Lesson(
    id: index.toString(),
    date: DateTime.now().add(Duration(days: Random().nextInt(1000) % 365)),
    start: '10:00',
    end: '11:00',
    tutor: null,
    duration: 61,
  );
});
