import 'package:flutter/material.dart';

import '../../../widgets/three_dimensional_container.dart';

class AppsContainer extends StatelessWidget {
  final String appName;
  final String appIconImagePath;
  const AppsContainer(
      {super.key, required this.appName, required this.appIconImagePath});

  @override
  Widget build(BuildContext context) {
    return ThreeDimensionalContainer(
      child: Row(
        children: [
          Image(
            height: 100,
            width: 100,
            image: AssetImage(appIconImagePath),
          ),
          Expanded(
            child: Text(
              appName,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontFamily: "Borel",
                  fontWeight: FontWeight.w500),
            ),
          ),
          Container(
            height: 100,
            width: 60,
            decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(12),
                    topRight: Radius.circular(12))),
            // ),
            child: const Icon(Icons.add, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
