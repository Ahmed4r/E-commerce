import 'dart:async';

import 'package:app1/ui/utils/appcolors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

typedef MyValidator = String? Function(String?);

class Customtextform extends StatelessWidget {
  String label;
  MyValidator validator;
  bool securedText;
  TextEditingController controller;
  TextInputType keyboardType;

  Customtextform(
      {required this.controller,
      required this.label,
      required this.keyboardType,
      required this.securedText,
      required this.validator});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        textInputAction: TextInputAction.next,
        style: TextStyle(color: Colors.black),
        validator: validator,
        obscureText: securedText,
        controller: controller,
        decoration: InputDecoration(
            suffixIcon: Icon(Icons.mode_edit_outline_sharp),
            errorMaxLines: 2,
            labelText: label,
            labelStyle: TextStyle(color: Colors.black),
            focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.red)),
            errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.red)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.red)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(color: Colors.blue))),
      ),
    );
  }
}
