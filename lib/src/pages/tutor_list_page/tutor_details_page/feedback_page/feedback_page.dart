import 'package:flutter/material.dart';
import 'package:lettutor/src/api/tutor_api.dart';
import 'package:lettutor/src/pages/tutor_list_page/tutor_details_page/feedback_page/feedback_card.dart';
import 'package:lettutor/src/models/tutor/tutor_feedback.dart';

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key, required this.userId});

  final String userId;

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  bool _isLoading = false;
  List<TutorFeedback> _feedbacks = [];

  @override
  void initState() {
    super.initState();
    _getFeedbacks();
  }

  _getFeedbacks() async {
    setState(() {
      _isLoading = true;
    });

    try {
      List<TutorFeedback> feedbacks =
          await TutorApi.getFeedback(widget.userId, 999, 1);
      if (feedbacks.isNotEmpty) {
        feedbacks.sort((a, b) => a.createdAt!.compareTo(b.createdAt!));
      }
      setState(() {
        _feedbacks = feedbacks;
        _isLoading = false;
      });
    } catch (e) {
      print("[_getFeedbacks] $e");
    }
  }

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
              _feedbacks.isEmpty
                  ? _isLoading
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : const Center(
                          child: Text("No reviews yet"),
                        )
                  : Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      child: ListView.builder(
                          itemCount: _feedbacks.length,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => FeedbackCard(
                              feedback:
                                  _feedbacks[_feedbacks.length - 1 - index])),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
