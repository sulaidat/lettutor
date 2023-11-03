import 'package:flutter/material.dart';
import 'package:lettutor/src/models/topic.dart';
import 'package:lettutor/src/tutor_list_page/tutor_details_page/tutor_details_page.dart';

import '../../../custom_widgets/pro_heading1.dart';
import '../../../custom_widgets/pro_header.dart';

class TopicDetailsPage extends StatelessWidget {
  const TopicDetailsPage({super.key, required this.topic});

  final Topic topic;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ProHeader(
                title: "Topic Details",
                end: ProSingleIconButton(icon: Icons.menu, onPressed: () {}),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    ProHeading1(text: "Slides"),
                    Placeholder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProSingleIconButton extends StatelessWidget {
  const ProSingleIconButton(
      {super.key, required this.icon, required this.onPressed});

  final IconData icon;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
      ),
      child: Icon(icon),
    );
  }
}