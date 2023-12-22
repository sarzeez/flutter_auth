import 'package:flutter/material.dart';
import 'package:flutter_auth/core/storage/storage.dart';
import 'package:flutter_auth/core/storage/storage_keys.dart';
import 'package:flutter_auth/view/login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  void navigateToLogin() async {
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
        (route) => false);

    // set isNew = false
    await StorageRepository.putBool(StorageKeys.isNew, false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: Colors.blueGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to our app',
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              onPressed: navigateToLogin,
              color: Colors.blue,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 7),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12), // <-- Radius
              ),
              child: const Text(
                'Continue',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
