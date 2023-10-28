import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String title;
  final TextInputType type;
  final TextInputAction action;
  final IconData icon;
  const CustomTextFormField(
      {super.key,
      required this.controller,
      required this.title,
      required this.type,
      required this.action,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "This field can't be empty";
        }
        return null;
      },
      controller: controller,
      keyboardType: type,
      textInputAction: action,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(20),
        border: InputBorder.none,
        hintText: title,
        hintStyle: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        fillColor: Colors.white,
        filled: true,
        suffixIcon: Icon(icon, color: Colors.blue),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(50),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
      ),
    );
  }
}
