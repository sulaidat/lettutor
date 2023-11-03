import 'package:flutter/material.dart';
import 'package:lettutor/src/helpers/padding.dart';
import 'package:lettutor/src/theme/color_schemes.g.dart';

class WaitingRoom extends StatefulWidget {
  const WaitingRoom({super.key, required this.onJoin,});

  final VoidCallback onJoin;

  @override
  State<WaitingRoom> createState() => _WaitingRoomState();
}

class _WaitingRoomState extends State<WaitingRoom> {
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
                title: Text("Meeting"),
                centerTitle: true,
                actions: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
                ],
                // leading: TextButton(onPressed: () {}, child: Text("Close")),
              ),
              Column(
                children: [
                  Text("Preration"),
                  vpad(10),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                        ],
                      ),
                      vpad(10),
                      Text("Ready to join?"),
                      vpad(10),
                      FilledButton(
                          onPressed: widget.onJoin,
                          child: Text("Join")),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
