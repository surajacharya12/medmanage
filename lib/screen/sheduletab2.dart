import 'package:flutter/material.dart';
import 'package:medmanage3/widegets/TabBarSection.dart';
import 'package:medmanage3/widegets/notification_icon_button.dart';

class CompletedTab extends StatefulWidget {
  const CompletedTab({super.key});

  @override
  _CompletedTabState createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  Color _bellIconColor = Colors.black;

  void _onBellIconTapped() {
    setState(() {
      _bellIconColor =
          _bellIconColor == Colors.black ? Colors.blue : Colors.black;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBarSection(
      tabName: "Completed",
      notification: CompletedNotification(),
      onNotification: (message) {
        print(message);
      },
      onPressed: _onBellIconTapped,
    );
  }
}

class CompletedNotification extends NotificationMessage {
  @override
  String getMessage() => "Notification from Completed";
}
