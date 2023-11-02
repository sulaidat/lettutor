import 'package:flutter/material.dart';
import 'package:lettutor/tutor_list_page/tutor_details_page/tutor_details_page.dart';

import '../../../custom_widgets/pro_header.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ProHeader(
              title: "Reviews",
              start: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.chevron_left,
                  size: 30,
                  color: theme.colorScheme.primary,
                ),
              ),
            ),
            Container(
              width: 100,
              height: 100,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
