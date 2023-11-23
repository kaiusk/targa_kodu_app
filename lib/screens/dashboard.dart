import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('TarkKodu'),
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                icon: Icon(Icons.exit_to_app_rounded
                    //color: Theme.of(context).colorScheme.primary,
                    ))
          ],
        ),
        body: const Center(
          child: Text('logged in'),
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
