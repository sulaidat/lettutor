import 'package:flutter/material.dart';
import 'helpers/padding.dart';

class TeacherListPage extends StatefulWidget {
  const TeacherListPage({super.key});

  @override
  State<TeacherListPage> createState() => _TeacherListPageState();
}

class _TeacherListPageState extends State<TeacherListPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ProfileButton(),
                  hpad(20),
                ],
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    UpcomingBanner(theme: theme),
                  ],
                ),
              ), // content
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileButton extends StatelessWidget {
  const ProfileButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        print("TeacherListPage: avatar pressed");
      },
      icon: ClipRRect(
        borderRadius: BorderRadius.circular(999),
        child: SizedBox(
          width: 30,
          height: 30,
          child: Image.asset(
            "assets/imgs/avt.jpg",
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

class UpcomingBanner extends StatelessWidget {
  const UpcomingBanner({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: theme.colorScheme.primary,
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
              ElevatedButton(
                onPressed: () {},
                child: Text("Join now"),
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
