import 'package:app1/ui/utils/appcolors.dart';
import 'package:flutter/material.dart';

class Sizedwidget extends StatefulWidget {
  String text;
  Sizedwidget({required this.text});

  @override
  State<Sizedwidget> createState() => _SizedwidgetState();
}

class _SizedwidgetState extends State<Sizedwidget> {
  Color c = Colors.white;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        toggleColor();
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: c,
          borderRadius: BorderRadius.circular(70),
        ),
        child: Center(
            child: Text(
          '${widget.text}',
          style: TextStyle(color: Colors.red),
        )),
      ),
    );
  }

  void toggleColor() {
    setState(() {
      c = c == Colors.white ? Appcolors.primaryColor : Colors.white;
    });
  }
}
