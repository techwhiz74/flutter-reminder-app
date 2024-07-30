// import 'package:flutter/material.dart';
//
// class NotificationCardWidget extends StatefulWidget {
//   final String cardTitle;
//   const NotificationCardWidget({
//     super.key,
//     this.cardTitle = 'Clock In Reminder',
//   });
//
//   @override
//   State<NotificationCardWidget> createState() => _NotificationCardWidgetState();
// }
//
// class _NotificationCardWidgetState extends State<NotificationCardWidget> {
//   bool _isChecked = false;
//   TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 0);
//
//   void _showTimePicker() async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//
//     if (pickedTime != null && pickedTime != selectedTime) {
//       setState(() {
//         selectedTime = pickedTime;
//       });
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: Colors.white,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 10),
//             child: ListTile(
//               title: Text(
//                 "${widget.cardTitle}",
//               ),
//               trailing: Switch(
//                 value: _isChecked,
//                 onChanged: (value) {
//                   setState(() {
//                     _isChecked = value;
//                   });
//                 },
//               ),
//             ),
//           ),
//           AnimatedContainer(
//             duration: const Duration(milliseconds: 400),
//             height: _isChecked ? 70.0 : 0.0,
//             child: SingleChildScrollView(
//               child: Column(
//                 children: [
//                   const Divider(
//                     indent: 30,
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 25,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           "Remind Me At",
//                         ),
//                         Padding(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 10,
//                           ),
//                           child: GestureDetector(
//                             onTap: _showTimePicker,
//                             child: Text(
//                               '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}',
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class NotificationCardWidget extends StatefulWidget {
  final String cardTitle;
  final FlutterLocalNotificationsPlugin notificationPlugin;
  const NotificationCardWidget({
    super.key,
    this.cardTitle = 'Clock In Reminder',
    required this.notificationPlugin,
  });

  @override
  State<NotificationCardWidget> createState() => _NotificationCardWidgetState();
}

class _NotificationCardWidgetState extends State<NotificationCardWidget> {
  bool _isChecked = false;
  TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 0);

  void _showTimePicker() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  void _scheduleNotification() async {
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'reminder_channel_id',
      'Reminder Notifications',
      channelDescription: 'Channel for Reminder notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );

    final NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await widget.notificationPlugin.zonedSchedule(
      0,
      widget.cardTitle,
      'It\'s time to ${widget.cardTitle.toLowerCase()}!',
      _nextInstanceOfSelectedTime(),
      platformChannelSpecifics,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
      UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  tz.TZDateTime _nextInstanceOfSelectedTime() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      selectedTime.hour,
      selectedTime.minute,
    );
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              title: Text("${widget.cardTitle}"),
              trailing: Switch(
                value: _isChecked,
                onChanged: (value) {
                  setState(() {
                    _isChecked = value;
                    if (_isChecked) {
                      _scheduleNotification();
                    } else {
                      widget.notificationPlugin.cancel(0);
                    }
                  });
                },
              ),
            ),
          ),
          AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            height: _isChecked ? 70.0 : 0.0,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Divider(indent: 30),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("Remind Me At"),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: GestureDetector(
                            onTap: _showTimePicker,
                            child: Text(
                              '${selectedTime.hour}:${selectedTime.minute.toString().padLeft(2, '0')}',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

