// alarm_logo.dart
import 'package:flutter/material.dart';

class AlarmLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 150.0,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.blue, // You can customize the color
      ),
      child: Icon(
        Icons.alarm,
        size: 80.0,
        color: Colors.white, // You can customize the color
      ),
    );
  }
}
