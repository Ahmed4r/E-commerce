import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String? Function(String?)? validator;
  TextEditingController? controller;

  String hint;
  CustomTextField(
      {required this.hint, required this.controller, required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextFormField(
        validator: validator,
        controller: controller,
        decoration: InputDecoration(
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.red)),
            errorMaxLines: 2,
            fillColor: Colors.white,
            filled: true,
            hintText: hint,
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
      ),
    );
  }
}
