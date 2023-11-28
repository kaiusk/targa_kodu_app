import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:targa_kodu_app/widgets/overview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPageIndex = 0;

   void cardSelect() {
     print('kaardi klikk');
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Image.asset('assets/images/icon.png'),
          centerTitle: true,
          title: const Text('TarkKodu'),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                tooltip: 'Logi välja',
                icon: const Icon(Icons.exit_to_app_rounded))
          ],
        ),
        body: const Overview(), /*ListView(
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
        ),*/
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          //indicatorColor: Theme.of(context).colorScheme.primaryContainer,
          selectedIndex: currentPageIndex,
          elevation: 4,
          //backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
