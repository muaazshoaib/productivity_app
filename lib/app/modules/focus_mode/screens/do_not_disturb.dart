import 'package:flutter/material.dart';
import 'package:flutter_dnd/flutter_dnd.dart';
import 'package:flutter_switch/flutter_switch.dart';

import '../../../utils/colors.dart';
import '../../../widgets/back_button.dart';
import '../widgets/image_container.dart';
import '../widgets/text_container.dart';

class DoNotDisturbScreen extends StatefulWidget {
  const DoNotDisturbScreen({super.key});

  @override
  State<DoNotDisturbScreen> createState() => _DoNotDisturbScreenState();
}

class _DoNotDisturbScreenState extends State<DoNotDisturbScreen> {
  bool selected = false;

  void setInterruptionFilter(int filter) async {
    final bool? isNotificationPolicyAccessGranted =
        await FlutterDnd.isNotificationPolicyAccessGranted;
    if (isNotificationPolicyAccessGranted != null &&
        isNotificationPolicyAccessGranted) {
      await FlutterDnd.setInterruptionFilter(filter);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackButtonWidget(onTap: () {
              Navigator.pop(context);
            }),
            const SizedBox(
              height: 10,
            ),
            const TextContainer(
                boldText: "Do Not Disturb",
                text2: "Stay focused with DND feature."),
            const ImageContainer(
              imagePath: "assets/images/Lock_with_key.png",
            ),

            const SizedBox(
                height: 16.0), // Space between image and toggle button
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Text(
                      'Mode is ${selected ? 'on' : 'off'}',
                      style: const TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FlutterSwitch(
                    width: MediaQuery.sizeOf(context).width *
                        0.35, // Set the desired width
                    height: 50.0, // Set the desired height
                    toggleSize:
                        60.0, // Set the desired size of the toggle circle
                    activeColor: Colors.black,
                    inactiveColor: const Color.fromARGB(255, 187, 182, 182),
                    value: selected,
                    onToggle: (bool value) {
                      if (value == true) {
                        setInterruptionFilter(
                            FlutterDnd.INTERRUPTION_FILTER_NONE);
                      } else {
                        setInterruptionFilter(
                            FlutterDnd.INTERRUPTION_FILTER_ALL);
                      }
                      setState(
                        () {
                          selected = value;
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
