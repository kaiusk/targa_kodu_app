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

   void cardSelect(String title) {
     print('kaardi $title klikk');
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
        body:  _buildPage(),
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

  Widget _buildPage() {
    switch (currentPageIndex) {
      case 0:
        return  Overview(cardSelect);
      case 1:
        return const Center(child: Text('kaamera leht'),);
      case 2:
        return const Center(child: Text('teadete leht'),);
      default:
        return Overview(cardSelect);
    }
  }
}
