import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String imagePath;

  const ImageContainer({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height:
          MediaQuery.sizeOf(context).height * 0.35, // Set the height as desired
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            //top right shadow is a bit darker
            BoxShadow(
              color: Colors.grey.shade500,
              offset: const Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
            ),
            //bottom right shadow is a bit lighter
            const BoxShadow(
                color: Colors.white,
                offset: Offset(-4, -4),
                blurRadius: 15,
                spreadRadius: 1)
          ]), // Optional: Add rounded corners

      child: Image(
          height: 200.0,
          width: MediaQuery.sizeOf(context).width * 0.25,
          //fit: BoxFit.cover,
          image: AssetImage(imagePath)),
    );
  }
}
