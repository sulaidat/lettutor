import 'package:flutter/material.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/models/lesson.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key, required this.history});
  final List<Lesson> history;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(title: Text("History"), centerTitle: true,),
              vpad(10),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Here is the list of lessons you have attended"),
                    vpad(10),
                    ListView.separated(
                      itemBuilder: (context, index) {
                        return _buildLessonCard(context, history[index]);
                      },
                      separatorBuilder: (context, index) {
                        return vpad(10);
                      },
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: history.length,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildLessonCard(BuildContext context, Lesson info) {
  final theme = Theme.of(context);
  return Container(
    decoration: BoxDecoration(
        color: theme.colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: Colors.grey,
            blurRadius: 4,
            offset: Offset(0, 2),
          )
        ],
        borderRadius: BorderRadius.circular(10)),
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${info.date}",
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "${info.start} - ${info.end}",
          style: theme.textTheme.titleSmall,
        ),
        Divider(),
        Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(999),
              child: Image.asset(
                "${info.tutor.imageUrl}",
                width: 70,
                height: 70,
                fit: BoxFit.cover,
              ),
            ),
            hpad(10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${info.tutor.name}",
                    style: theme.textTheme.titleMedium,
                  ),
                  Row(
                    children: [Icon(Icons.flag), hpad(5), Text("Vietnam")],
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: EdgeInsets.all(0),
                        visualDensity:
                            VisualDensity(horizontal: 0, vertical: -4)),
                    onPressed: () {},
                    child: Row(
                      children: [
                        Icon(Icons.details),
                        Text("Details"),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
