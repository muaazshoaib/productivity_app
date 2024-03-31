import 'package:flutter/material.dart';

class MyHomeScreenIcon extends StatelessWidget {
  final String imagePath;
  final String text;
  final Function()? onTap;
  const MyHomeScreenIcon({
    super.key,
    required this.text,
    required this.imagePath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
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
              ],
            ),
            child: Image(
              height: MediaQuery.sizeOf(context).height / 13.5,
              width: MediaQuery.sizeOf(context).width / 6,
              image: AssetImage(imagePath),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
          )
        ],
      ),
    );
  }
}
