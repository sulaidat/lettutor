import 'package:flutter/material.dart';
import 'package:lettutor/src/models/review.dart';
import 'package:lettutor/src/models/tutor.dart';
import 'package:lettutor/src/models/tutor_list.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

class ReviewsPage extends StatelessWidget {
  const ReviewsPage({super.key, required this.tutorId});

  final String tutorId;

  @override
  Widget build(BuildContext context) {
    final List<Review> reviews =
        context.read<TutorList>().getTutorById(tutorId).reviews!;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar(
              title: Text("Reviews"),
              centerTitle: true,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: reviews.length,
                itemBuilder: (context, index) {
                  final review = reviews[index];
                  return ListTile(
                    leading: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [// TODO: leading image not aligned correctly
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                            "https://cdn-icons-png.flaticon.com/512/6596/6596121.png",
                          ),
                        ),
                      ],
                    ),
                    title: Text(review.name!),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(review.rating!.toStringAsFixed(1)),
                            Icon(Icons.star),
                          ],
                        ),
                        Text(review.review!),

                        Text(DateFormat('MMMd').format(review.date!),
                            style: TextStyle(
                                color: Colors.grey,
                                fontSize:
                                    12)), // assuming review has a date field
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
