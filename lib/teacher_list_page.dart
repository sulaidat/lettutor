import 'package:flutter/material.dart';
import 'helpers/padding.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  children: [
                    UpcomingBanner(theme: theme),
                    vpad(10),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.background,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 4,
                            color: Colors.grey,
                            offset: Offset(0, 2),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(999),
                                child: Image.network(
                                  "https://i.pinimg.com/280x280_RS/01/6a/45/016a45c595efdc6d97c7fbc5a562f78b.jpg",
                                  width: 70,
                                  height: 70,
                                ),
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sừ Lai Đạt",
                                      style:
                                          theme.textTheme.titleMedium?.copyWith(
                                        color: theme.colorScheme.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.flag),
                                        Text("Vietnam"),
                                      ],
                                    ),
                                    RatingBarIndicator(
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star_rounded,
                                        color: Colors.amber,
                                      ),
                                      rating: 3,
                                      unratedColor: Colors.grey,
                                      itemCount: 5,
                                      itemSize: 20.0,
                                    ),
                                  ],
                                ),
                              ),
                              ToggleIcon(
                                onPressed: () {},
                                value: false,
                              )
                            ],
                          ),
                          // TODO Tags
                          Text(
                            "Sừ Lai Đạt aka Slaydark is a very handsome guys who teaches Vietnamese. His favorite line is 'Hello World! Hello World! Hello World! Hello World! Hello World! Hello World! Hello World! Hello World!.......................... '",
                            maxLines: 4,
                            overflow: TextOverflow.fade,
                            style: theme.textTheme.bodyMedium,
                          )
                        ],
                      ),
                    )
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

class ToggleIcon extends StatelessWidget {
  const ToggleIcon({
    super.key,
    required this.value,
    required this.onPressed,
    this.onIcon = const Icon(Icons.favorite),
    this.offIcon = const Icon(Icons.favorite_border_outlined),
  });

  final bool value;
  final Function() onPressed;
  final Widget onIcon, offIcon;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: value ? onIcon : offIcon,
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
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: Colors.grey,
            offset: Offset(0, 2),
          ),
        ],
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

class TeacherCard extends StatelessWidget {
  const TeacherCard({
    super.key,
    required this.avatar,
    required this.name,
    required this.country,
    required this.rating,
  });

  final avatar, name, country, rating;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
