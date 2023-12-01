import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatefulWidget {
  const AppShell({
    super.key,
    required this.child,
    required this.selectedIndex,
  });

  final Widget child;
  final int selectedIndex;

  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final router = GoRouter.of(context);

    return MaterialApp(
      title: "Home page",
      theme: Theme.of(context),
      home: Scaffold(
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (idx) {
            if (idx == 0) router.go('/tutor/all');
            if (idx == 1) router.go('/schedule');
            if (idx == 2) router.go('/courses');
          },
          selectedIndex: widget.selectedIndex,
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
        body: widget.child,
      ),
    );
  }
}
