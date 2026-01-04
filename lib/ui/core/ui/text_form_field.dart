import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  const AppTextFormField({super.key, this.labelText, this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(0.5),
          ),
          labelText: labelText,
      ),
      controller: controller,
    );
  }
}
