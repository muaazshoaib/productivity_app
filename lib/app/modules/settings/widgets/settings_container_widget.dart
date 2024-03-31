import 'package:flutter/material.dart';

import '../../../widgets/my_body_text.dart';
import '../../../widgets/three_dimensional_container.dart';

class SettingScreenContainer extends StatelessWidget {
  final void Function()? onTap;
  final String text;
  const SettingScreenContainer({super.key, this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ThreeDimensionalContainer(
        //height: MediaQuery.sizeOf(context).height/8,
        width: MediaQuery.sizeOf(context).width,
        child: MyBodyText(text: text),
      ),
    );
  }
}
