import 'package:flutter/material.dart';
import 'package:jitsi_meet_flutter_sdk/jitsi_meet_flutter_sdk.dart';
import 'package:lettutor/src/pages/login_page/auth.dart';

Widget vpad(double height) {
  return SizedBox(
    height: height,
  );
}

Widget hpad(double width) {
  return SizedBox(
    width: width,
  );
}

void to(BuildContext context, Widget page) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => page));
}

List<String> str2list(String str) {
  return str.split(',').map((e) => e.trim()).toList();
}

joinMeeting(String token, String userId, String tutorId) async {
  final option = JitsiMeetConferenceOptions(
    serverURL: "https://meet.lettutor.com/",
    configOverrides: {
      "startWithAudioMuted": true,
      "startWithVideoMuted": true,
    },
    token: token,
    room: tutorId.hashCode.toString(),
  );

  final listener = JitsiMeetEventListener(conferenceJoined: (url) {
    print("Joined $url");
  });

  try {
    await AppState.jitsiMeet.join(option, listener);
  } catch (e) {
    print("[SchedulePage::_joinMeeting] $e");
  }
}
