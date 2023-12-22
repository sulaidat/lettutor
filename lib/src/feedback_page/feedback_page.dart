import 'package:flutter/material.dart';
import 'package:lettutor/src/feedback_page/feedback_card.dart';
import 'package:lettutor/src/models/tutor/tutor_feedback.dart';

class FeedbackPage extends StatelessWidget {
  const FeedbackPage({super.key, required this.feedbacks});

  final List<TutorFeedback> feedbacks;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: Text("Reviews"),
                centerTitle: true,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: ListView.builder(
                    itemCount: feedbacks.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => FeedbackCard(
                        feedback: feedbacks[feedbacks.length - 1 - index])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
