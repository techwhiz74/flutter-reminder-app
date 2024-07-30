// import 'package:flutter/material.dart';
//
// import 'custom_container.dart';
// import 'days_list_widget.dart';
// import 'notification_box.dart';
// import 'notification_card_widget.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const NotificationView(),
//     );
//   }
// }
//
// class NotificationView extends StatefulWidget {
//   const NotificationView({super.key});
//
//   @override
//   State<NotificationView> createState() => _NotificationViewState();
// }
//
// class _NotificationViewState extends State<NotificationView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "Notifications",
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Text(
//                   "Reminders",
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               NotificationCardWidget(
//                 cardTitle: "Click In Reminder",
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               NotificationCardWidget(
//                 cardTitle: "Click Out Reminder",
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               CustomContainer(
//                 childContainer: NotificationBox(
//                   titleBox: "When Enter Job Site",
//                 ),
//               ),
//               CustomContainer(
//                 childContainer: NotificationBox(
//                   titleBox: "When Leave Job Site",
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               const DaysListWidget(),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Center(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 25),
//                   child: Text(
//                     'You\'ll receive the clock in and clock out reminders on the selected days only',
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 20,
//               ),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Text(
//                   "notifications",
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const CustomContainer(
//                 childContainer: NotificationBox(
//                   titleBox: 'When I Enter a Job Langite',
//                 ),
//               ),
//               const CustomContainer(
//                 childContainer: NotificationBox(
//                   titleBox: 'When I Leave a Job Langite',
//                 ),
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               const Center(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 25),
//                   child: Text(
//                     'You\'ll receive the clock in and clock out reminders on the selected days only',
//                   ),
//                 ),
//               ),
//               const SizedBox(
//                 height: 25,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
// import 'package:timezone/data/latest.dart' as tz;
// import 'package:timezone/timezone.dart' as tz;
// import 'custom_container.dart';
// import 'days_list_widget.dart';
// import 'notification_box.dart';
// import 'notification_card_widget.dart';
//
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
// FlutterLocalNotificationsPlugin();
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   tz.initializeTimeZones();
//
//   const AndroidInitializationSettings initializationSettingsAndroid =
//   AndroidInitializationSettings('@mipmap/ic_launcher');
//
//   final InitializationSettings initializationSettings = InitializationSettings(
//     android: initializationSettingsAndroid,
//   );
//
//   await flutterLocalNotificationsPlugin.initialize(initializationSettings);
//
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const NotificationView(),
//     );
//   }
// }
//
// class NotificationView extends StatefulWidget {
//   const NotificationView({super.key});
//
//   @override
//   State<NotificationView> createState() => _NotificationViewState();
// }
//
// class _NotificationViewState extends State<NotificationView> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Notifications"),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Text("Reminders"),
//               ),
//               const SizedBox(height: 10),
//               NotificationCardWidget(
//                 cardTitle: "Click In Reminder",
//                 notificationPlugin: flutterLocalNotificationsPlugin,
//               ),
//               const SizedBox(height: 20),
//               NotificationCardWidget(
//                 cardTitle: "Click Out Reminder",
//                 notificationPlugin: flutterLocalNotificationsPlugin,
//               ),
//               const SizedBox(height: 20),
//               CustomContainer(
//                 childContainer: NotificationBox(
//                   titleBox: "When Enter Job Site",
//                 ),
//               ),
//               CustomContainer(
//                 childContainer: NotificationBox(
//                   titleBox: "When Leave Job Site",
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const DaysListWidget(),
//               const SizedBox(height: 10),
//               const Center(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 25),
//                   child: Text(
//                     'You\'ll receive the clock in and clock out reminders on the selected days only',
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 25),
//                 child: Text("notifications"),
//               ),
//               const SizedBox(height: 10),
//               const CustomContainer(
//                 childContainer: NotificationBox(
//                   titleBox: 'When I Enter a Job Langite',
//                 ),
//               ),
//               const CustomContainer(
//                 childContainer: NotificationBox(
//                   titleBox: 'When I Leave a Job Langite',
//                 ),
//               ),
//               const SizedBox(height: 10),
//               const Center(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 25),
//                   child: Text(
//                     'You\'ll receive the clock in and clock out reminders on the selected days only',
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 25),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;
import 'custom_container.dart';
import 'days_list_widget.dart';
import 'notification_box.dart';
import 'notification_card_widget.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  tz.initializeTimeZones();

  const AndroidInitializationSettings initializationSettingsAndroid =
  AndroidInitializationSettings('@mipmap/ic_launcher');

  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const NotificationView(),
    );
  }
}

class NotificationView extends StatefulWidget {
  const NotificationView({super.key});

  @override
  State<NotificationView> createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {
  void _triggerTestNotification() async {
    final AndroidNotificationDetails androidPlatformChannelSpecifics =
    AndroidNotificationDetails(
      'test_channel_id',
      'Test Notifications',
      channelDescription: 'Channel for Test notifications',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: true,
    );

    final NotificationDetails platformChannelSpecifics =
    NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.show(
      0,
      'Test Notification',
      'This is a test notification',
      platformChannelSpecifics,
      payload: 'test_payload',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text("Reminders"),
              ),
              const SizedBox(height: 10),
              NotificationCardWidget(
                cardTitle: "Clock In Reminder",
                notificationPlugin: flutterLocalNotificationsPlugin,
              ),
              const SizedBox(height: 20),
              NotificationCardWidget(
                cardTitle: "Clock Out Reminder",
                notificationPlugin: flutterLocalNotificationsPlugin,
              ),
              const SizedBox(height: 20),
              CustomContainer(
                childContainer: NotificationBox(
                  titleBox: "When Enter Job Site",
                ),
              ),
              CustomContainer(
                childContainer: NotificationBox(
                  titleBox: "When Leave Job Site",
                ),
              ),
              const SizedBox(height: 20),
              const DaysListWidget(),
              const SizedBox(height: 10),
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'You\'ll receive the clock in and clock out reminders on the selected days only',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Text("notifications"),
              ),
              const SizedBox(height: 10),
              const CustomContainer(
                childContainer: NotificationBox(
                  titleBox: 'When I Enter a Job Langite',
                ),
              ),
              const CustomContainer(
                childContainer: NotificationBox(
                  titleBox: 'When I Leave a Job Langite',
                ),
              ),
              const SizedBox(height: 10),
              const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    'You\'ll receive the clock in and clock out reminders on the selected days only',
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: _triggerTestNotification,
                child: const Text('Trigger Test Notification'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

