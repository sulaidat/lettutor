import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lettutor/src/custom_widgets/pro_avatar.dart';
import 'package:lettutor/src/custom_widgets/pro_heading.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/pages/login_page/auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
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
                ProAvatar(
                  url: AppState.user.avatar!,
                  height: 90,
                  width: 90,
                ),
                Heading2(text: AppState.user.name!),
                vpad(5),
                ListTile(
                  title: Text('Update Information'),
                  leading: Icon(Icons.person),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {
                    context.push('/setting/profile');
                  },
                ),
                ListTile(
                  title: Text('Become a Tutor'),
                  leading: Icon(Icons.school),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                Divider(),
                SwitchListTile(
                  title: Text('Dark mode'),
                  // value: Get.rootController.themeMode == ThemeMode.dark,
                  value: Get.isDarkMode,
                  onChanged: (bool value) {
                    print(Get.isDarkMode);
                    // Get.changeThemeMode(value ? ThemeMode.dark : ThemeMode.light);
                    Get.changeThemeMode(
                        Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                    setState(() {
                      value = !value;
                    });
                  },
                  secondary: Icon(Icons.dark_mode),
                ),
                ListTile(
                  title: Text('Language'),
                  leading: Icon(Icons.language),
                  trailing: Icon(Icons.chevron_right),
                  onTap: () {},
                ),
                Divider(),
                // ListTile(
                //   title: Text('Change Password'),
                //   leading: Icon(Icons.lock),
                //   trailing: Icon(Icons.chevron_right),
                //   onTap: () {},
                // ),
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
