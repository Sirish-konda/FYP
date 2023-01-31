import 'package:flutter/material.dart';

class ChangeTextField extends StatelessWidget {
  final String title;
  const ChangeTextField({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(color: Colors.white),
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white)),
        labelText: title,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
