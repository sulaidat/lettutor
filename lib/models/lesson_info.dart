import 'package:lettutor/models/tutor.dart';

class LessonInfo {
  Tutor tutor;
  String? date;
  String? start;
  String? end;

//<editor-fold desc="Data Methods">
  LessonInfo({
    required this.tutor,
    this.date,
    this.start,
    this.end,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is LessonInfo &&
          runtimeType == other.runtimeType &&
          tutor == other.tutor &&
          date == other.date &&
          start == other.start &&
          end == other.end);

  @override
  int get hashCode =>
      tutor.hashCode ^ date.hashCode ^ start.hashCode ^ end.hashCode;

  LessonInfo copyWith({
    Tutor? tutor,
    String? time,
    String? start,
    String? end,
  }) {
    return LessonInfo(
      tutor: tutor ?? this.tutor,
      date: time ?? this.date,
      start: start ?? this.start,
      end: end ?? this.end,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'tutor': this.tutor,
      'time': this.date,
      'start': this.start,
      'end': this.end,
    };
  }

  factory LessonInfo.fromMap(Map<String, dynamic> map) {
    return LessonInfo(
      tutor: map['tutor'] as Tutor,
      date: map['time'] as String,
      start: map['start'] as String,
      end: map['end'] as String,
    );
  }

//</editor-fold>
}
