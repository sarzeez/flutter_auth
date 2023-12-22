import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final bool obscureText;
  final TextEditingController? controller;
  final String label;

  const CustomTextField({
    super.key,
    this.obscureText = false,
    required this.controller,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: obscureText,
      controller: controller,
      cursorColor: const Color.fromARGB(255, 63, 65, 66),
      style: const TextStyle(fontSize: 20),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: const TextStyle(
            fontSize: 20, color: Color.fromARGB(255, 63, 65, 66)),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 63, 65, 66)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 63, 65, 66)),
        ),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
      ),
    );
  }
}
