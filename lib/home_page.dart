import 'package:flutter/material.dart';
import 'teacher_list_page.dart';
import 'schedule_page.dart';
import 'courses_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Home page",
      theme: ThemeData(
          colorSchemeSeed: Colors.blue[800],
          useMaterial3: true,
          brightness: Brightness.light),
      darkTheme: ThemeData(
          colorSchemeSeed: Colors.blue[800],
          useMaterial3: true,
          brightness: Brightness.dark),
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (value) {
            setState(() {
              pageIndex = value;
            });
          },
          selectedIndex: pageIndex,
          // indicatorColor: Colors.amber,
          labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
          destinations: [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              icon: Icon(Icons.calendar_today_outlined),
              label: "Schedule",
              selectedIcon: Icon(Icons.calendar_today),
            ),
            NavigationDestination(
              icon: Icon(Icons.book_outlined),
              label: "Courses",
              selectedIcon: Icon(Icons.book),
            ),
          ],
        ),
        body: [
          TeacherListPage(),
          SchedulePage(),
          CoursesPage(),
        ][pageIndex],
      ),
    );
  }
}
