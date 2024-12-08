import 'package:flutter/material.dart';
import 'package:medmanage3/widegets/TabBarSection.dart';
import 'package:medmanage3/widegets/notification_icon_button.dart';

class CancelTab extends StatefulWidget {
  const CancelTab({super.key});

  @override
  _CancelTabState createState() => _CancelTabState();
}

class _CancelTabState extends State<CancelTab> {
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
      tabName: "Cancel",
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
  String getMessage() => "Notification from Cancel";
}
