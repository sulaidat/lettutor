import 'package:flutter/material.dart';
import 'package:lettutor/helpers/padding.dart';

class UpcomingBanner extends StatelessWidget {
  const UpcomingBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.grey,
            offset: Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
        color: theme.colorScheme.primary,
        // gradient: LinearGradient(
        //   stops: [0, 1],
        //   begin: Alignment.bottomLeft,
        //   end: Alignment.topRight,
        //   colors: <Color>[
        //     Colors.blue.shade600,
        //     Colors.blue.shade900,
        //   ],
        // ),
      ),
      child: Column(
        children: [
          Text(
            "Upcoming Lesson",
            style: theme.textTheme.headlineMedium?.copyWith(
              color: theme.colorScheme.onPrimary,
            ),
          ),
          vpad(5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Tue, 24 Oct 00:00 - 00:30",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onPrimary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "Start in 1:00:00",
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.amberAccent,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              hpad(10),
              FilledButton(
                style: FilledButton.styleFrom(
                    // padding: ,
                    backgroundColor: theme.colorScheme.onPrimary,
                    foregroundColor: theme.colorScheme.primary,
                    textStyle: theme.textTheme.titleMedium),
                onPressed: () {},
                child: Row(
                  children: [
                    Text("Join now"),
                  ],
                ),
              ),
            ],
          ),
          vpad(5),
          Text(
            "Total lesson time: 1000 hours 59 minutes",
            style: TextStyle(
              color: theme.colorScheme.onPrimary,
            ),
          ),
        ],
      ),
    );
  }
}

// class TeacherCard extends StatelessWidget {
//   const TeacherCard({
//     super.key,
//     required this.avatar,
//     required this.name,
//     required this.country,
//     required this.rating,
//   });

//   final avatar, name, country, rating;

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }
