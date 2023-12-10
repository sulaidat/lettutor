import 'package:flutter/material.dart';
import 'package:lettutor/src/models/tutor_list.dart';
import 'package:provider/provider.dart';

class ProFavToggleIcon extends StatefulWidget {
  const ProFavToggleIcon({
    Key? key,
    required this.tutorId,
    required this.hook,
  }) : super(key: key);

  final String tutorId;
  final Function(bool) hook;

  @override
  State<ProFavToggleIcon> createState() => _ProFavToggleIconState();
}

class _ProFavToggleIconState extends State<ProFavToggleIcon> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    final tutorList = context.watch<TutorList>();
    isOn = tutorList.isFavorite(widget.tutorId);
    return IconButton(
      onPressed: () {
        setState(() {
          if (isOn) {
            tutorList.removeFromFavorites(widget.tutorId);
          } else {
            tutorList.addToFavorites(widget.tutorId);
          }
          isOn = !isOn;
        });
        widget.hook(isOn);
      },
      icon: Icon(
        isOn ? Icons.favorite : Icons.favorite_border,
        color: isOn ? Colors.red : Colors.grey,
      ),
    );
  }
}