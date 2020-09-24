import 'package:flutter/material.dart';

class ExpandedCenter extends StatelessWidget {
  final String text;
  final double fontSize;

  ExpandedCenter({
    this.text,
    this.fontSize = 18.0,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Text(
      "$text",
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
      ),
    ));
  }
}
