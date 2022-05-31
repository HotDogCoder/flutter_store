import 'package:flutter/material.dart';

class CustomScreen extends StatelessWidget {
  final Color color;

  const CustomScreen({ required this.color });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}