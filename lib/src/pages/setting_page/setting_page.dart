import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/pages/login_page/auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(
              children: [
                AppBar(
                  title: Text("Settings"),
                  centerTitle: true,
                ),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: NetworkImage("${AppState.user.avatar}"),
                ),
                vpad(5),
                TextButton(onPressed: () {}, child: Text("Edit profile")),
                vpad(5),
                SettingButton(
                  icon: Icons.person,
                  label: "Account",
                  onPressed: () {},
                ),
                vpad(5),
                SettingButton(
                  icon: Icons.play_lesson,
                  label: "Become a tutor",
                  onPressed: () {},
                ),
                vpad(20),
                FilledButton(
                  onPressed: () async {
                    final confirmed = await _showLogOutConfirmDialog(context);
                    if (confirmed) {
                      final pref = await SharedPreferences.getInstance();
                      pref.remove("refresh_token");
                      AppState.isLoggedIn = false;
                      context.go('/login');
                    }
                  },
                  style: FilledButton.styleFrom(backgroundColor: Colors.red),
                  child: Row(
                    children: [
                      Icon(Icons.exit_to_app),
                      Text("Log out"),
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

class SettingButton extends StatelessWidget {
  const SettingButton(
      {super.key,
      required this.icon,
      required this.label,
      required this.onPressed});

  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onPressed,
      child: Container(
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
        child: Row(
          children: [Icon(icon), hpad(5), Text(label)],
        ),
      ),
    );
  }
}

_handleLogOut(bool confirmed) async {
  if (confirmed) {}
  return false;
}

_showLogOutConfirmDialog(BuildContext context) async {
  return showDialog<bool>(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Log Out'),
        content: const Text('Are you sure you want to log out?'),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: const Text('NO')),
          TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: const Text('YES')),
        ],
      );
    },
  ).then((value) => value ?? false);
}
