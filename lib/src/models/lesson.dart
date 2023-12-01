import 'package:lettutor/src/models/tutor.dart';
import 'package:flutter/foundation.dart';

class Lesson extends ChangeNotifier {
  String id;
  DateTime date;
  String start;
  String end;
  Tutor? tutor;
  int? duration;

  Lesson({
    required this.id,
    required this.date,
    required this.start,
    required this.end,
    this.tutor,
    this.duration
  });

  void updateLesson() {
    notifyListeners();
  }
}
