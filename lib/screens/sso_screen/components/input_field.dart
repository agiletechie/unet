import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    Key? key,
    required this.hintText,
    this.obscureText = false,
    required this.onSaved,
  }) : super(key: key);

  final String hintText;
  final bool obscureText;
  final void Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 12.0,
      ),
      validator: (value) {
        if (value!.isEmpty || value.length < 6) {
          return 'Enter at least 6 characters';
        }
        return null;
      },
      onSaved: onSaved,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: const Color(0xff5e5f6b).withOpacity(0.1),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20.0),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(style: BorderStyle.none),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(style: BorderStyle.none),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
