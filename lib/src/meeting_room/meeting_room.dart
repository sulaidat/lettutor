import 'package:flutter/material.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/theme/color_schemes.g.dart';

class MeetingRoom extends StatefulWidget {
  const MeetingRoom({super.key, required this.onLeave,});

  final VoidCallback onLeave;

  @override
  State<MeetingRoom> createState() => _MeetingRoomState();
}

class _MeetingRoomState extends State<MeetingRoom> {
  bool micOff = false;
  bool videoOff = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(useMaterial3: true, colorScheme: darkColorScheme),
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              AppBar(
                title: Text("Room title"),
                leading: Center(
                  child: FilledButton(
                    onPressed: null,
                    style: FilledButton.styleFrom(
                      shape: RoundedRectangleBorder(),
                      visualDensity: VisualDensity(vertical: -4),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    ),
                    child: Text("00:01:23"),
                  ),
                ),
                leadingWidth: 100,
                actions: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.flip_camera_ios_outlined)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.volume_up_outlined)),
                  IconButton(
                      onPressed: () {}, icon: Icon(Icons.people_alt_outlined)),
                ],
              ),
              Expanded(child: Placeholder()),
              BottomAppBar(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    micOff
                        ? FilledButton(
                            onPressed: () {
                              setState(() {
                                micOff = !micOff;
                              });
                            },
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: Icon(Icons.mic_off_outlined),
                          )
                        : OutlinedButton(
                            onPressed: () {
                              setState(() {
                                micOff = !micOff;
                              });
                            },
                            style: OutlinedButton.styleFrom(),
                            child: Icon(Icons.mic_none),
                          ),
                    hpad(10),
                    videoOff
                        ? FilledButton(
                            onPressed: () {
                              setState(() {
                                videoOff = !videoOff;
                              });
                            },
                            style: FilledButton.styleFrom(
                                backgroundColor: Colors.red),
                            child: Icon(Icons.videocam_off_outlined),
                          )
                        : OutlinedButton(
                            onPressed: () {
                              setState(() {
                                videoOff = !videoOff;
                              });
                            },
                            child: Icon(Icons.videocam_outlined),
                          ),
                    hpad(10),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.chat_outlined)),
                    hpad(10),
                    IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
                    hpad(10),
                    FilledButton(
                      onPressed: widget.onLeave,
                      style: FilledButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        backgroundColor: Colors.red,
                        foregroundColor: Colors.white,
                      ),
                      child: Icon(Icons.call_end_outlined),
                    ),
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
