import 'package:flutter/material.dart';

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
