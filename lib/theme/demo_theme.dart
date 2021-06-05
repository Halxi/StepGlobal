import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DemoTheme {
  static BoxDecoration demoDecoration(Color startColor, Color endColor) {
    return BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [startColor, endColor]));
  }

}
