import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medmanage3/screen/chatsscreen.dart';
import 'package:medmanage3/widegets/Messageallwidget.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Massagetaball extends StatefulWidget {
  const Massagetaball({Key? key}) : super(key: key);

  @override
  _MassagetaballState createState() => _MassagetaballState();
}

class _MassagetaballState extends State<Massagetaball>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  bool isNotificationEnabled = false;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    _initializeNotifications();
  }

  void _initializeNotifications() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('@mipmap/ic_launcher');

    const LinuxInitializationSettings initializationSettingsLinux =
        LinuxInitializationSettings(defaultActionName: 'Open Notification');

    InitializationSettings initializationSettings;

    if (Platform.isLinux) {
      initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        linux: initializationSettingsLinux,
      );
    } else {
      initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
      );
    }

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
    _checkNotificationPermission();
  }

  void _checkNotificationPermission() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final settings = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.areNotificationsEnabled();

      setState(() {
        isNotificationEnabled = settings ?? false;
      });
    } else {
      setState(() {
        isNotificationEnabled = true;
      });
    }
  }

  Future<void> _requestPermission() async {
    if (Platform.isAndroid || Platform.isIOS) {
      final settings = await flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<
              AndroidFlutterLocalNotificationsPlugin>()
          ?.areNotificationsEnabled();

      if (settings == false) {
        setState(() {
          isNotificationEnabled = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Please enable notifications in system settings."),
        ));
      } else {
        setState(() {
          isNotificationEnabled = true;
        });
        _showNotification();
      }
    } else {
      setState(() {
        isNotificationEnabled = true;
      });
    }
  }

  Future<void> _showNotification() async {
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      'your_channel_id',
      'your_channel_name',
      channelDescription: 'your_channel_description',
      importance: Importance.max,
      priority: Priority.high,
      showWhen: false,
    );
    const NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      'Message Notification',
      'You have received a new message!',
      platformChannelSpecifics,
      payload: 'item x',
    );
  }

  Future<void> _cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(0);
  }

  Future<void> _showNotificationSettings() async {
    if (isNotificationEnabled) {
      bool? result = await _showConfirmDialog(
          "Do you want to turn off the message notifications?");
      if (result != null && result) {
        setState(() {
          isNotificationEnabled = false;
        });
        _cancelNotification();
      }
    } else {
      bool? result = await _showConfirmDialog(
          "Do you want to turn on the message notifications?");
      if (result != null && result) {
        _requestPermission();
      }
    }
  }

  Future<void> _showRingtoneSettings() async {
    String selectedRingtone = await _showRingtonePicker("Choose Call Ringtone");
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Selected Ringtone: $selectedRingtone")));
  }

  Future<String> _showRingtonePicker(String title) async {
    return await showDialog<String>(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text(title),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  ListTile(
                    title: Text('Ringtone 1'),
                    onTap: () => Navigator.of(context).pop('Ringtone 1'),
                  ),
                  ListTile(
                    title: Text('Ringtone 2'),
                    onTap: () => Navigator.of(context).pop('Ringtone 2'),
                  ),
                  ListTile(
                    title: Text('Ringtone 3'),
                    onTap: () => Navigator.of(context).pop('Ringtone 3'),
                  ),
                ],
              ),
            );
          },
        ) ??
        'None';
  }

  Future<bool?> _showConfirmDialog(String message) async {
    return showDialog<bool>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirmation"),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: Text("Yes"),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Massage",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 18),
        ),
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        actions: [
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'Notification') {
                _showNotificationSettings();
              } else if (value == 'Sound') {
                _showRingtoneSettings();
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'Notification',
                child: Text(isNotificationEnabled
                    ? 'Turn Notifications Off'
                    : 'Turn Notifications On'),
              ),
              PopupMenuItem<String>(
                value: 'Sound',
                child: Text('Change Ringtone'),
              ),
            ],
            icon: Icon(Icons.menu, color: Colors.black),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.bottomToTop,
                  child: const Chatscreen(),
                ),
              );
            },
            child: Messageallwidget(
              image: "lib/icons/male-doctor.png",
              Maintext: "Dr. Marcus Horizon",
              subtext: "I don't have any fever, but headaches...",
              time: "10:24 AM",
              message_count: "2",
            ),
          ),
          Messageallwidget(
            image: "lib/icons/doctor3.png",
            Maintext: "Dr. Alysa Hana",
            subtext: "Hello, How can I help you?",
            time: "10:24 AM",
            message_count: "1",
          ),
          Messageallwidget(
            image: "lib/icons/doctor2.png",
            Maintext: "Dr. Maria Elena",
            subtext: "Do you have fever?",
            time: "10:24 AM",
            message_count: "3",
          ),
          Messageallwidget(
            image: "lib/icons/doctor4.png",
            Maintext: "Dr. John Smith",
            subtext: "Let's review your symptoms together.",
            time: "9:30 AM",
            message_count: "5",
          ),
          Messageallwidget(
            image: "lib/icons/doctor5.png",
            Maintext: "Dr. Emily Rose",
            subtext: "Schedule your next appointment!",
            time: "8:15 AM",
            message_count: "4",
          ),
        ],
      ),
    );
  }
}
