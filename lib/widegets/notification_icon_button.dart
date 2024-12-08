import 'package:flutter/material.dart';

abstract class NotificationMessage {
  String getMessage();
}

class NotificationIconButton extends StatelessWidget {
  final NotificationMessage notification;
  final IconData icon;
  final Color iconColor;
  final double iconSize;
  final VoidCallback onPressed;

  const NotificationIconButton({
    Key? key,
    required this.notification,
    required this.onPressed,
    this.icon = Icons.notifications,
    this.iconColor = Colors.black,
    this.iconSize = 24.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(icon, color: iconColor, size: iconSize),
      onPressed: onPressed,
    );
  }
}
