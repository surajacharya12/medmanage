import 'package:flutter/material.dart';
import 'package:medmanage3/widegets/notification_icon_button.dart';

class TabBarSection extends StatelessWidget {
  final String tabName;
  final NotificationMessage notification;
  final Function(String message) onNotification;
  final VoidCallback onPressed;
  const TabBarSection({
    Key? key,
    required this.tabName,
    required this.notification,
    required this.onNotification,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(tabName),
      trailing: NotificationIconButton(
        notification: notification,
        icon: Icons.notifications,
        iconColor: Colors.blue,
        onPressed: onPressed,
      ),
    );
  }
}
