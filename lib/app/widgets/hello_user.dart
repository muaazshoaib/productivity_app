import 'package:flutter/material.dart';

import '../utils/colors.dart';

class HelloUser extends StatelessWidget {
  final String name;
  final String assetImagePath;

  const HelloUser({
    super.key,
    required this.name,
    required this.assetImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Text(
            'Hello $name',
            style: const TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            width: 5,
          ),
          const Icon(Icons.waving_hand),
          Expanded(child: Container()),
          Container(
            // width: 100, // Adjust the size as needed
            // height: 100, // Adjust the size as needed
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black, // Set the border color
                width: 3.0, // Set the border width
              ),
            ),
            child: CircleAvatar(
              backgroundColor: kBackgroundColor,
              backgroundImage: AssetImage(assetImagePath),
              radius: 25.0,
            ),
          ),
        ],
      ),
    );
  }
}
