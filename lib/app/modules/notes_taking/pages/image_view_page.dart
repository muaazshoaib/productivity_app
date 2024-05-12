import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fyp/app/modules/notes_taking/model/image.dart';

class ImageView extends StatelessWidget {
  final ImageModel image;

  const ImageView({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Image View",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Image.file(
          File(image.imagePath),
        ),
      ),
    );
  }
}
