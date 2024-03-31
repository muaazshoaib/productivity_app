import 'package:flutter/material.dart';

class ThreeDimensionalContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;

  const ThreeDimensionalContainer(
      {super.key, required this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
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
      child: child,
    );
  }
}
