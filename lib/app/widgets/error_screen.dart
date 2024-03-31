import 'package:flutter/material.dart';

import 'my_body_text.dart';
import 'my_heading.dart';

class ErrorScreen extends StatelessWidget {
  final String errorMessage;

  const ErrorScreen({
    super.key,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const MyHeading(text: 'Error Screen'),
          MyBodyText(text: errorMessage)
        ],
      ),
    );
  }
}
