import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/components/form/text_field.dart';
import 'package:flutter_auth/config/dio_config.dart';
import 'package:flutter_auth/core/storage/storage.dart';
import 'package:flutter_auth/core/storage/storage_keys.dart';
import 'package:flutter_auth/view/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;

  void setLoading(bool state) {
    setState(() {
      isLoading = state;
    });
  }

  void submitHandler() async {
    setLoading(true);
    try {
      Response response = await dio.post(
        '/token',
        data: {
          'mobile': '994624913',
          'password': '123456',
        },
      );

      if (response.statusCode == 200) {
        dynamic token = response.data['data']['token'];
        StorageRepository.putString(StorageKeys.token, token.toString());
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
        return;
      }
      setLoading(false);
    } on DioException catch (e) {
      debugPrint('catch error');
      debugPrint(e.message);
      setLoading(false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        width: double.infinity,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomTextField(
                label: 'Email',
                controller: emailController,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextField(
                label: 'Password',
                controller: passwordController,
                obscureText: true,
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                elevation: 0,
                focusElevation: 0,
                highlightElevation: 0,
                padding: const EdgeInsets.symmetric(vertical: 16),
                color: Colors.blue,
                minWidth: double.infinity,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                onPressed: submitHandler,
                child: isLoading
                    ? (const SizedBox(
                        width: 23,
                        height: 23,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      ))
                    : (const Text(
                        'Submit',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
