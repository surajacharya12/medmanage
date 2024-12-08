import 'package:flutter/material.dart';
import 'package:medmanage3/widegets/TabBarSection.dart';
import 'package:medmanage3/widegets/notification_icon_button.dart';

class UpcomingTab extends StatefulWidget {
  const UpcomingTab({super.key});

  @override
  _UpcomingTabState createState() => _UpcomingTabState();
}

class _UpcomingTabState extends State<UpcomingTab> {
  Color _bellIconColor = Colors.black; // Initial color of the bell icon

  // Method to handle bell icon tap and toggle color
  void _onBellIconTapped() {
    setState(() {
      _bellIconColor = _bellIconColor == Colors.black
          ? Colors.blue
          : Colors.black; // Toggle the color
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBarSection(
      tabName: "Upcoming",
      notification: UpcomingNotification(),
      onNotification: (message) {
        print(message); // Handle notification logic
      },
      onPressed:
          _onBellIconTapped, // Pass the onPressed callback to handle bell icon click
    );
  }
}

class UpcomingNotification extends NotificationMessage {
  @override
  String getMessage() => "Notification from Upcoming";
}
