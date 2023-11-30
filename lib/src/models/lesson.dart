import 'package:lettutor/src/models/tutor.dart';
import 'package:flutter/foundation.dart';

class Lesson extends ChangeNotifier {
  String id;
  DateTime date;
  String start;
  String end;
  Tutor? tutor;

  Lesson({
    required this.id,
    required this.date,
    required this.start,
    required this.end,
    this.tutor,
  });

  void updateLesson() {
    notifyListeners();
  }
}
