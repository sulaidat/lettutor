// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:lettutor/src/custom_widgets/pro_heading.dart';
// import 'package:lettutor/src/models/schedule/schedule.dart';
// import 'package:provider/provider.dart';

// class BookingConfirmDialog extends StatefulWidget {
//   const BookingConfirmDialog({Key? key, required this.schedule})
//       : super(key: key);

//   final Schedule schedule;

//   @override
//   State<BookingConfirmDialog> createState() => _BookingConfirmDialogState();
// }

// class _BookingConfirmDialogState extends State<BookingConfirmDialog> {
//   final _controller = TextEditingController();

//   late final String start;
//   late final String end;
//   late final String date;

//   @override
//   void initState() {
//     super.initState();
//     start = widget.schedule.startTime ?? '??:??';
//     end = widget.schedule.endTime ?? '??:??';
//     date = DateFormat.yMMMMEEEEd().format(
//         DateTime.fromMillisecondsSinceEpoch(widget.schedule.startTimestamp!));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: const Text('Book This Tutor'),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         crossAxisAlignment: CrossAxisAlignment.stretch,
//         children: [
//           Heading3(text: 'Booking time'),
//           const SizedBox(height: 4),
//           Text(
//             '  $start - $end',
//             style: const TextStyle(fontSize: 16),
//           ),
//           Text(
//             '  $date',
//             style: const TextStyle(fontSize: 16),
//           ),
//           const SizedBox(height: 8),
//           Heading3(text: "Text"),
//           const SizedBox(height: 4),
//           SizedBox(
//             width: MediaQuery.of(context).size.width,
//             child: TextField(
//               controller: _controller,
//               minLines: 3,
//               maxLines: 4,
//               decoration: const InputDecoration(
//                 hintText: 'Your requests for the tutor',
//                 hintStyle:
//                     TextStyle(fontWeight: FontWeight.w300, color: Colors.grey),
//                 contentPadding: EdgeInsets.all(12),
//                 border: OutlineInputBorder(
//                     borderSide: BorderSide(color: Colors.grey),
//                     borderRadius: BorderRadius.all(Radius.circular(16))),
//               ),
//             ),
//           ),
//         ],
//       ),
//       actions: [
//         TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text(
//               'CANCEL',
//               style: TextStyle(color: Colors.red),
//             )),
//         TextButton(
//             onPressed: () async {
//               await BookingService.bookClass(
//                 scheduleDetailIds: [
//                   widget.schedule.scheduleDetails?.first.id ?? ''
//                 ],
//                 note: _controller.text,
//                 token: accessToken,
//               );

//               if (mounted) {
//                 Navigator.pop(context);
//                 Navigator.pop(context);
//               }
//             },
//             child: const Text('BOOK')),
//       ],
//     );
//   }
// }