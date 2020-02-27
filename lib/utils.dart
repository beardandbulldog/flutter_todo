
import 'dart:math' as math;
import 'dart:ui';
import 'package:flutter/material.dart';

class Utils {


  ///Method to get a random color
  static getRandomColor() =>
      Color((math.Random().nextDouble() * 0xFFFFFF).toInt() << 0)
          .withOpacity(1.0);

  static List<Color> buttonGradient = [
    Colors.cyan.shade600,
    Colors.blue.shade600
  ];
}