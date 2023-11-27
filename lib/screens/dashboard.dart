import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/card_widget.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var currentPageIndex = 0;

   void cardSelect() {
     print('kaardi klikk');
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.amber,
          leading: Image.asset('assets/images/icon.png'),
          centerTitle: true,
          title: const Text('TarkKodu', textScaleFactor: 1.5,),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                tooltip: 'Logi välja',
                icon: const Icon(Icons.exit_to_app_rounded))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children:  <Widget>[
            CardWidget(value: '+23°C', title: 'Õues', icon: Icons.device_thermostat, selectCard: cardSelect),
            CardWidget(value: '23kWh', title: 'Energia', icon: Icons.bolt_outlined,selectCard: cardSelect),
            CardWidget(value: '23mm', title: 'Vihm', icon: Icons.water_drop,selectCard: cardSelect),
            CardWidget(value: '+23°C', title: 'Elutuba', icon: Icons.device_thermostat, selectCard: cardSelect),
            CardWidget(value: '+23°C', title: 'Köök', icon: Icons.device_thermostat, selectCard: cardSelect),
            CardWidget(value: '+23°C', title: 'Magamistuba', icon: Icons.device_thermostat, selectCard: cardSelect),
            CardWidget(value: '+23°C', title: 'Koridor', icon: Icons.device_thermostat, selectCard: cardSelect),
            CardWidget(value: '+23°C', title: 'Kelder', icon: Icons.device_thermostat, selectCard: cardSelect),
            CardWidget(value: '+23°C', title: 'Saun', icon: Icons.device_thermostat, selectCard: cardSelect),
          ],
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Theme.of(context).colorScheme.primaryContainer,
          selectedIndex: currentPageIndex,
          elevation: 4,
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          destinations: const <Widget>[
            NavigationDestination(
              icon: Icon(Icons.dashboard),
              label: 'Ülevaade',
            ),
            NavigationDestination(
              icon: Icon(Icons.video_camera_front_outlined),
              label: 'Kaamera',
            ),
            NavigationDestination(
              icon: Icon(Icons.notifications),
              label: 'Teavitused',
            ),
          ],
        ));
  }
}
