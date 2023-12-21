import 'package:flutter/material.dart';
import 'package:flutter_auth/core/storage/storage.dart';
import 'package:flutter_auth/core/storage/storage_keys.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void logout() {
    StorageRepository.putBool(StorageKeys.isNew, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: const Text('Home Page'),
      ),
      body: Center(
          child: ElevatedButton(
        onPressed: logout,
        child: const Text('Logout'),
      )),
    );
  }
}
