import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:targa_kodu_app/widgets/card_widget.dart';

class CardObject {
  String id;
  String label;
  String unit;
  IconData icon;

  CardObject(this.id, this.label, this.unit, this.icon);
}

class Overview extends StatelessWidget {
  final Function(String title) cardSelected;

  const Overview(this.cardSelected, {super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('sensors').snapshots(),
      builder: (ctx, snapshots) {
        if (snapshots.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        if (!snapshots.hasData || snapshots.data!.docs.isEmpty) {
          return const Center(
            child: Text('pole midagi näidata :('),
          );
        }

        if (snapshots.hasError) {
          return const Center(
            child: Text('midagi läks viltu...'),
          );
        }

        final filteredMessages = snapshots.data!.docs;

        final cardList = [
          CardObject('sensor.kodu_total_energy', 'Energia', 'kWh',
              Icons.bolt_outlined),
          CardObject(
              'sensor.temperatuur_oues', 'Õues', '°C', Icons.device_thermostat),
          CardObject('sensor.elutuba2_temperatuur', 'Elutuba', '°C',
              Icons.device_thermostat),
          CardObject('sensor.koogi_temperatuur', 'Köök', '°C',
              Icons.device_thermostat),
          CardObject('sensor.lumi_lumi_weather_temperature', 'Magamistuba',
              '°C', Icons.device_thermostat),
          CardObject('sensor.esiku_temperatuur', 'Koridor', '°C',
              Icons.device_thermostat),
          CardObject('sensor.saun_2', 'Saun', '°C', Icons.device_thermostat),
          CardObject(
              'sensor.kelder_2', 'Kelder', '°C', Icons.device_thermostat),
        ];

        return ListView.builder(
            itemCount: cardList.length,
            itemBuilder: (ctx, index) {
              var mySensor = filteredMessages
                  .firstWhere((sensor) => sensor.id == cardList[index].id);
              //print(mySensor.data()); {name: Elutuba2 temperatuur, state: 20.8, last_changed: 2023-11-28T09:21:19.970315+00:00}
              return CardWidget(
                  title: cardList[index].label,
                  value: double.parse(mySensor.data()['state'])
                          .toStringAsFixed(1) +
                      cardList[index].unit,
                  icon: cardList[index].icon,
                  selectCard:  cardSelected,
              );
            });
      },
    );
  }
}
