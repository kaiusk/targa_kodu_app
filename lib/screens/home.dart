import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:targa_kodu_app/screens/camera.dart';
import 'package:targa_kodu_app/screens/events.dart';
import 'package:targa_kodu_app/screens/room.dart';
import 'package:targa_kodu_app/widgets/overview.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var currentPageIndex = 0;
  var singleSensor = false;
  var cardTitle = '';

  void cardSelect(String title) {
    setState(() {
      cardTitle = title;
      singleSensor = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          foregroundColor: Colors.lightBlue,
          leading: Image.asset('assets/images/icon.png'),
          centerTitle: true,
          title: const Text(
            'TarkKodu',
            style: TextStyle(color: Colors.lightBlue),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                tooltip: 'Logi välja',
                icon: const Icon(Icons.exit_to_app_rounded))
          ],
        ),
        body: _buildPage(),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
              singleSensor = false;
            });
          },
          selectedIndex: currentPageIndex,
          elevation: 4,
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

  Widget _buildPage() {
    if (singleSensor) {
      return RoomScreen(
          cardTitle: cardTitle,
          goBack: () {
            setState(() {
              singleSensor = false;
            });
          });
    }
    switch (currentPageIndex) {
      case 0:
        return Overview(cardSelect);
      case 1:
        return const CameraScreen();
      case 2:
        return const NotificationScreen();
      default:
        return Overview(cardSelect);
    }
  }
}
