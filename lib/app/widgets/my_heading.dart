import 'package:flutter/material.dart';

class MyHeading extends StatelessWidget {
  const MyHeading({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.black,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          // fontFamily: 'Borel',
        ),
      ),
    );
  }
}
