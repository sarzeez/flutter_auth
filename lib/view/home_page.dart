import 'package:flutter/material.dart';
import 'package:flutter_auth/core/storage/storage.dart';
import 'package:flutter_auth/core/storage/storage_keys.dart';
import 'package:flutter_auth/view/login_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String token = StorageRepository.getString(StorageKeys.token) ?? '';
  int selectedIndex = 0;

  void toggleTab(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  List<Widget> pages = [
    const Text('Home'),
    const Text('Settings'),
    const Text('Profile'),
  ];

  void logout() {
    StorageRepository.delete(StorageKeys.token);

    Future.delayed(Duration.zero).then(
      (value) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (context) => const LoginPage(),
            ),
            (route) => false);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Home Page'),
      ),
      body: Scaffold(
        body: Center(
          child: pages[selectedIndex],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: toggleTab,
        selectedItemColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: 'Settings',
            icon: Icon(Icons.settings),
          ),
          BottomNavigationBarItem(
            label: 'Profile',
            icon: Icon(Icons.account_circle_sharp),
          ),
        ],
      ),
    );
  }
}
