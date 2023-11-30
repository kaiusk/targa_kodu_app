import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  List<Notification> notifications = [
    Notification(Icons.video_call_rounded, 'Kaamera "Hoov" tuvastas liikumise',
        DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())),
    Notification(Icons.tv_off, 'Elutoa TV lülitus välja.',
        DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())),
    Notification(Icons.lightbulb, 'Elutoa valgus lülitus välja.',
        DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())),
  ];

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(
          const Duration(seconds: 1),
          () {
            setState(() {
              notifications.add(
                Notification(Icons.lightbulb, 'Elutoa valgus lülitus välja.',
                    DateFormat('yyyy-MM-dd – kk:mm').format(DateTime.now())),
              );
            });
          },
        );
      },
      child: ListView.builder(
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
      ),
    );
  }
}

class Notification {
  final IconData icon;
  final String text;
  final String timestamp;

  Notification(this.icon, this.text, this.timestamp);
}
