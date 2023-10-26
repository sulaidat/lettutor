import 'package:flutter/material.dart';
import 'package:lettutor/models/tutor.dart';
import 'package:lettutor/teacher_list_page/tutor_specialties.dart';

import '../helpers/padding.dart';
import 'tutor_card_minimal.dart';
import 'reviews_page/reviews_page.dart';

class TutorDetailsPage extends StatefulWidget {
  const TutorDetailsPage({
    super.key,
    required this.tutor,
  });

  final Tutor tutor;

  @override
  State<TutorDetailsPage> createState() => _TutorDetailsPageState();
}

class _TutorDetailsPageState extends State<TutorDetailsPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                ProHeader(
                  title: 'Tutor List',
                  start: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(
                        Icons.chevron_left,
                        size: 30,
                        color: theme.colorScheme.primary,
                      )),
                ),
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
                      TutorCardMinimal(tutor: widget.tutor),
                      vpad(5),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${widget.tutor.bio}",
                          maxLines: 4,
                          overflow: TextOverflow.fade,
                          style: theme.textTheme.bodyMedium,
                        ),
                      ),
                      vpad(5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: ProButton(
                              onPressed: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              selectedIcon: Icons.favorite,
                              unselectedIcon: Icons.favorite_border,
                              isSelected: isFavorite,
                              label: "Favorite",
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: VerticalDivider(),
                          ),
                          Expanded(
                            child: ProButton(
                              onPressed: () {
                                to(context, ReviewsPage());
                              },
                              selectedIcon: Icons.star,
                              unselectedIcon: Icons.star_border,
                              isSelected: false,
                              label: "Reviews",
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            child: VerticalDivider(),
                          ),
                          Expanded(
                            child: ProButton(
                              onPressed: () {},
                              selectedIcon: Icons.report,
                              unselectedIcon: Icons.report_gmailerrorred,
                              isSelected: false,
                              label: "Report",
                              color: theme.colorScheme.error,
                            ),
                          ),
                        ],
                      ),
                      vpad(5),
                      FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.edit_calendar),
                              hpad(5),
                              Text("Book now"),
                            ],
                          ))
                    ],
                  ),
                ),
                vpad(10),
                Align(
                  alignment: Alignment.topLeft,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Education",
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
                      Text(
                        "Languages",
                        style: theme.textTheme.titleMedium,
                      ),
                      ProChipsFromString(string: "English, Vietnamese"),
                      Text(
                        "Specialties",
                        style: theme.textTheme.titleMedium,
                      ),
                      ProChipsFromString(
                          string: "Pwn, Re, Crypto, Web, Forensics"),
                      Text(
                        "Insert Introduction video here",
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                        "Suggested courses",
                        style: theme.textTheme.titleMedium,
                      ),
                      Row(
                        children: [
                          Text(
                            "Suggested courses",
                            style: theme.textTheme.titleSmall,
                          ),
                          ElevatedButton(onPressed: () {}, child: Text("Go")),
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Suggested courses",
                            style: theme.textTheme.titleSmall,
                          ),
                          ElevatedButton(onPressed: () {}, child: Text("Go")),
                        ],
                      ),
                      Text(
                        "Interests",
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
                      Text(
                        "Teaching experience",
                        style: theme.textTheme.titleMedium,
                      ),
                      Text(
                          "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProButton extends StatelessWidget {
  const ProButton(
      {Key? key,
      required this.onPressed,
      required this.selectedIcon,
      required this.unselectedIcon,
      required this.isSelected,
      required this.label,
      this.color})
      : super(key: key);

  final VoidCallback onPressed;
  final IconData selectedIcon;
  final IconData unselectedIcon;
  final bool isSelected;
  final String label;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent),
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            isSelected ? selectedIcon : unselectedIcon,
            color: color,
          ),
          Text(
            label,
            textAlign: TextAlign.center,
            style: theme.textTheme.labelMedium,
          ),
        ],
      ),
    );
  }
}

class ProHeader extends StatelessWidget {
  const ProHeader({super.key, this.start, required this.title, this.end});

  final String title;
  final Widget? start, end;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        start ?? SizedBox.shrink(),
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            color: theme.colorScheme.primary,
          ),
        ),
        end ?? SizedBox.shrink(),
      ],
    );
  }
}
