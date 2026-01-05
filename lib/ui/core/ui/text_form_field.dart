import 'package:flutter/material.dart';

class AppTextFormField extends StatelessWidget {
  final String? labelText;
  final TextEditingController? controller;
  final bool? readOnly;
  final GestureTapCallback? onTap;
  const AppTextFormField({super.key, this.labelText, this.controller, this.readOnly, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            labelText: labelText,
        ),
        controller: controller,
        onTap: onTap,
      ),
    );
  }
}
