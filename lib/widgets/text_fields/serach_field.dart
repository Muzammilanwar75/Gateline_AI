import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  final String hintText;
  final String? imagePath;
  final Icon? prefixicon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const SearchTextField({
    super.key,
    this.prefixicon,
    required this.hintText,
    this.imagePath,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        prefix: Icon(prefixicon?.icon),
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),

        // 👇 Rounded blue border
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.blue, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
        ),

        // 👇 Suffix image (instead of icon)
        suffixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            imagePath!,
            height: 24,
            width: 24,
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
