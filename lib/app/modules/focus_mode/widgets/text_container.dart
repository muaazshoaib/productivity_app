import 'package:flutter/material.dart';

class TextContainer extends StatelessWidget {
  final String boldText;
  final String text2;
  final String? text3;

  const TextContainer(
      {super.key, required this.boldText, required this.text2, this.text3});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 300,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            boldText,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            text2,
            style: const TextStyle(
                color: Colors.black, fontSize: 17, fontWeight: FontWeight.w400),
          ),
        ],
      ),
      // decoration: BoxDecoration(
      //     color: Colors.grey[300],
      //     borderRadius: BorderRadius.circular(12),
      //     boxShadow: [
      //       //top right shadow is a bit darker
      //       BoxShadow(
      //         color: Colors.grey.shade500,
      //         offset: Offset(4, 4),
      //         blurRadius: 15,
      //         spreadRadius: 1,
      //       ),
      //       //bottom right shadow is a bit lighter
      //       BoxShadow(
      //           color: Colors.white,
      //           offset: Offset(-4, -4),
      //           blurRadius: 15,
      //           spreadRadius: 1)
      //     ]),
    );
  }
}
