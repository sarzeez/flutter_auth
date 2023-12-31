import 'package:flutter/material.dart';
import 'package:flutter_auth/core/storage/storage.dart';
import 'package:flutter_auth/core/storage/storage_keys.dart';
import 'package:flutter_auth/view/home_page.dart';
import 'package:flutter_auth/view/login_page.dart';
import 'package:flutter_auth/view/welcome_page.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 800)).then((value) {
      _checkAccessToken();
    });
    super.initState();
  }

  void _checkAccessToken() {
    // check token is invalid then navigate to login page otherwise navigat to home page
    String? token = StorageRepository.getString(StorageKeys.token);

    if (StorageRepository.getBool(StorageKeys.isNew, defValue: true)) {
      Future.delayed(Duration.zero).then(
        (value) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const WelcomePage(),
              ),
              (route) => false);
        },
      );
    } else if (token == null || JwtDecoder.isExpired(token)) {
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
    } else {
      Future.delayed(Duration.zero).then(
        (value) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
              (route) => false);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(color: Colors.lightBlueAccent),
        child: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Splash Screen'),
            ],
          ),
        ),
      ),
    );
  }
}
