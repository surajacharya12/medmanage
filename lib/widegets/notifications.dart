abstract class NotificationMessage {
  String getMessage();
}

class SchedulesNotification extends NotificationMessage {
  @override
  String getMessage() => "Notification from Schedules";
}

class UpcomingNotification extends NotificationMessage {
  @override
  String getMessage() => "Notification from Upcoming";
}

class CompletedNotification extends NotificationMessage {
  @override
  String getMessage() => "Notification from Completed";
}

class CancelNotification extends NotificationMessage {
  @override
  String getMessage() => "Notification from Cancel";
}

class DefaultNotification extends NotificationMessage {
  @override
  String getMessage() => "Default notification";
}
