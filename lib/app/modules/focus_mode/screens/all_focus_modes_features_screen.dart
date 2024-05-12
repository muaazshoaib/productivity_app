import 'package:flutter/material.dart';

import '../../../utils/colors.dart';

import '../../../widgets/inside_shadow_container.dart';
import '../widgets/feature_container.dart';
import '../widgets/text_container.dart';
import 'alarm_only_screen.dart';
import 'do_not_disturb.dart';
import 'priority_only.dart';

class AllFocusModesFeaturesScreen extends StatelessWidget {
  const AllFocusModesFeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        title: const Text(
          "Focus Mode",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // BackButtonWidget(
              //   onTap: () {
              //     Navigator.pop(context);
              //   },
              // ),
              const SizedBox(height: 10),
              const InsideShadowContainer(
                child: TextContainer(
                    boldText: "Elevate Your Focus",
                    text2: "Select a Mode to boost efficiency."),
              ),
              const SizedBox(
                height: 20,
              ),
              FeatureContainer(
                imagePath: "assets/images/ClocK_animated.png",
                text: "Alarm Only",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AlarmOnlyScreen()),
                  );
                },
              ),
              FeatureContainer(
                imagePath: "assets/images/Lock.png",
                text: "Do not Disturb",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DoNotDisturbScreen()));
                },
              ),
              FeatureContainer(
                imagePath: "assets/images/focus.png",
                text: "Priority Only",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const PriorityScreen()),
                  );
                },
              ),
            ]),
      ),
    );
  }
}
