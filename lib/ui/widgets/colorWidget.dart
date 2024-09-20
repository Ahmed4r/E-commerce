import 'package:flutter/material.dart';

class Colorwidget extends StatefulWidget {
  final Color color;

  @override
  State<Colorwidget> createState() => _ColorwidgetState();
  Colorwidget({required this.color});
}

class _ColorwidgetState extends State<Colorwidget> {
  bool ispicked = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        toogleCheck();
      },
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(70),
        ),
        child: Center(
          child: ispicked
              ? Icon(
                  Icons.check, // Icon when `ispicked` is true
                  color: Colors.white,
                )
              : Icon(
                  Icons.close, // Icon when `ispicked` is false
                  color: Colors.transparent,
                ),
        ),
      ),
    );
  }

  void toogleCheck() {
    setState(() {
      ispicked = !ispicked;
    });
  }
}
