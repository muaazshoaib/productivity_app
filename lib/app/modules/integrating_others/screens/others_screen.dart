import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../widgets/back_button.dart';
import '../../../widgets/my_heading.dart';
import '../widgets/apps_container.dart';

class IntegratingOthers extends StatelessWidget {
  const IntegratingOthers({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.06,
            ),
            Row(
              children: [
                BackButtonWidget(onTap: () {
                  Navigator.pop(context);
                }),
                const Expanded(
                  child: MyHeading(text: "Other Features"),
                ),
              ],
            ),
            const AppsContainer(
              appName: "ChatGpt",
              appIconImagePath:
                  "assets/images/chatGpt_icon.png", //Keep Image Size of 48px
            ),
            const AppsContainer(
              appName: "Email",
              appIconImagePath: "assets/images/email_icon.png",
            ),
          ],
        ),
      ),
    );
  }
}
