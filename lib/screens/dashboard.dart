import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var currentPageIndex = 0;

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
                tooltip: 'Logi välja',
                icon: const Icon(Icons.exit_to_app_rounded))
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(8),
          children: const <Widget>[
            Card(
                child: ListTile(
                    title: Text("Battery Full"),
                    subtitle: Text("The battery is full."),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://images.unsplash.com/photo-1547721064-da6cfb341d50")),
                    trailing: Icon(Icons.star))),
            Card(
                child: ListTile(
                    title: Text("Anchor"),
                    subtitle: Text("Lower the anchor."),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
                    trailing: Icon(Icons.star))),
            Card(
                child: ListTile(
                    title: Text("Alarm"),
                    subtitle: Text("This is the time."),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
                    trailing: Icon(Icons.star))),
            Card(
                child: ListTile(
                    title: Text("Ballot"),
                    subtitle: Text("Cast your vote."),
                    leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                            "https://miro.medium.com/fit/c/64/64/1*WSdkXxKtD8m54-1xp75cqQ.jpeg")),
                    trailing: Icon(Icons.star)))
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
