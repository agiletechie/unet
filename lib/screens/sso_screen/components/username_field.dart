import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({
    Key? key,
    required this.onSaved,
  }) : super(key: key);

  final void Function(String?) onSaved;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
        fontSize: 12.0,
      ),
      onSaved: onSaved,
      validator: (val) {
        if (val!.isEmpty) {
          return 'Enter Username';
        }
        return null;
      },
      decoration: InputDecoration(
        constraints: const BoxConstraints(maxWidth: 84.0),
        hintText: 'Enter Username',
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
    );
  }
}
