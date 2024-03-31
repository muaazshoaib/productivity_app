import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class InsideShadowContainer extends StatelessWidget {
  final Widget child;
  final double? height;
  final double? width;
  const InsideShadowContainer(
      {super.key, required this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            //top right shadow is a bit darker
            BoxShadow(
                color: Colors.grey.shade500,
                offset: const Offset(6.0, 6.0),
                blurRadius: 10,
                spreadRadius: 1,
                inset: true),
            //bottom right shadow is a bit lighter
            BoxShadow(
                color: Colors.white.withOpacity(0.8),
                offset: const Offset(-6, -6),
                blurRadius: 10,
                spreadRadius: 1,
                inset: true)
          ],
          gradient: LinearGradient(
              colors: [Colors.grey.shade200, Colors.grey.shade300],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: const [0.1, 09])),
      child: child,
    );
  }
}
