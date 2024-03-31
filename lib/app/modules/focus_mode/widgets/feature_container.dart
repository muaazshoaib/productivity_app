import 'package:flutter/material.dart';

class FeatureContainer extends StatelessWidget {
  final String imagePath;
  final String text;
  final Function()? onTap;

  const FeatureContainer({
    super.key,
    required this.imagePath,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
            ]), // Rounded corners

        padding: const EdgeInsets.symmetric(
            horizontal: 10.0, vertical: 5), // Adjust padding as needed
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imagePath,
                  height: 90.0, // Adjust image height as needed
                  width: 80.0, // Adjust image width as needed
                  fit: BoxFit.cover, // Fit the image within the container
                ),
              ),
            ),
            const SizedBox(width: 20.0), // Space between image and text
            Expanded(
              flex: 1,
              child: Text(
                text,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
