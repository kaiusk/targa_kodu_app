import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatelessWidget {
  final List<Notification> notifications = [
    Notification(Icons.video_call_rounded, 'Kaamera "Hoov" tuvastas liikumise',
        DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())),
    Notification(Icons.tv_off, 'Elutoa TV lülitus välja.',
        DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())),
    Notification(Icons.lightbulb, 'Elutoa valgus lülitus välja.',
        DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())),
  ];

  NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        return ListTile(
          iconColor: Colors.lightBlueAccent,
          leading: Icon(notifications[index].icon),
          title: Text(notifications[index].text),
          subtitle: Text(
            notifications[index].timestamp,
            textScaleFactor: .75,
          ),
        );
      },
    );
  }
}

class Notification {
  final IconData icon;
  final String text;
  final String timestamp;

  Notification(this.icon, this.text, this.timestamp);
}
