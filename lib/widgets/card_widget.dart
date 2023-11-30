import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String sensorId;
  final String title;
  final IconData icon;
  final String value;
  final Function selectCard;

  const CardWidget({
    super.key,
    required this.sensorId,
    required this.title,
    required this.value,
    required this.icon,
    required this.selectCard,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(
                      icon,
                      size: 40,
                      color: Colors.lightBlueAccent,
                    ),
                    Text(
                      value,
                      textScaleFactor: 3,
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Text(title),
                ),
              ],
            ),
            InkWell(
              onTap: ()=>selectCard(title),
              child: const Icon(Icons.more_vert),
            ),
          ],
        ),
      ),
    );
  }
}
