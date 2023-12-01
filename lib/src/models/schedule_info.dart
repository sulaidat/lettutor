import 'package:lettutor/src/models/lesson.dart';
import 'package:flutter/foundation.dart';

class ScheduleInfo with ChangeNotifier {
  List<Lesson>? availableLessons;
  List<Lesson>? bookedLessons;
  List<Lesson>? completedLessons;

  ScheduleInfo({
    this.availableLessons,
    this.bookedLessons,
    this.completedLessons,
  });

  List<Lesson>? getAvailableLessonsByTutorId(String id) {
    // return availableLessons?.where((lesson) => lesson.tutor?.id == id).toList();
    List<Lesson>? lessons = [];
    for (var i = 0; i < availableLessons!.length; i++) {
      if (availableLessons![i].tutor?.id == id) {
        lessons.add(availableLessons![i]);
      }
    }
    return lessons;
  }

  void bookLesson(String id) {
    // Lesson lesson = availableLessons?.firstWhere((lesson) => lesson.id == id, orElse: () => null);
    Lesson? lesson;
    for (var i = 0; i < availableLessons!.length; i++) {
      if (availableLessons![i].id == id) {
        lesson = availableLessons![i];
        break;
      }
    }
    if (lesson != null) {
      bookedLessons?.add(lesson);
      availableLessons?.remove(lesson);
      notifyListeners();
    }
  }

  void cancelLesson(String id) {
    // final lesson = bookedLessons?.firstWhere((lesson) => lesson.id == id);
    Lesson? lesson;
    for (var i = 0; i < bookedLessons!.length; i++) {
      if (bookedLessons![i].id == id) {
        lesson = bookedLessons![i];
        break;
      }
    }
    if (lesson != null) {
      availableLessons?.add(lesson);
      bookedLessons?.remove(lesson);
      notifyListeners();
    }
  }

  void completeLesson(String id) {
    // final lesson = bookedLessons?.firstWhere((lesson) => lesson.id == id);
    Lesson? lesson;
    for (var i = 0; i < bookedLessons!.length; i++) {
      if (bookedLessons![i].id == id) {
        lesson = bookedLessons![i];
        break;
      }
    }
    if (lesson != null) {
      completedLessons?.add(lesson);
      bookedLessons?.remove(lesson);
      notifyListeners();
    }
  }

  void sortBookedLessons() {
    bookedLessons?.sort((a, b) => a.date.compareTo(b.date));
  }

  void sortCompletedLessons() {
    completedLessons?.sort((a, b) => a.date.compareTo(b.date));
  }
}
