import 'dart:async';
import 'package:flutter/material.dart';

class LessonCountdown extends StatefulWidget {
  final DateTime upcomingLessonTime;

  LessonCountdown({required this.upcomingLessonTime});

  @override
  State<LessonCountdown> createState() => _LessonCountdownState();
}

class _LessonCountdownState extends State<LessonCountdown> {
  Timer? _timer;
  late Duration _timeUntilLesson;

  @override
  void initState() {
    super.initState();
    _timeUntilLesson = widget.upcomingLessonTime.difference(DateTime.now());
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(
      Duration(seconds: 1),
      (Timer timer) {
        if (_timeUntilLesson.inSeconds == 0) {
          timer.cancel();
        } else {
          setState(() {
            _timeUntilLesson -= Duration(seconds: 1);
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Text(
      'Time until lesson: ${_timeUntilLesson.inHours}:${_timeUntilLesson.inMinutes.remainder(60).toString().padLeft(2, '0')}:${_timeUntilLesson.inSeconds.remainder(60).toString().padLeft(2, '0')}',
      style: theme.textTheme.bodyMedium?.copyWith(
        color: Colors.amberAccent,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
