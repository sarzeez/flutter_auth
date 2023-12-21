import 'package:flutter/material.dart';
import 'package:flutter_auth/view/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3)).then((value) {
      _checkAccessToken();
    });
    super.initState();
  }

  void _checkAccessToken() {
    // check token is invalid then navigate to login page otherwise navigat to home page
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
