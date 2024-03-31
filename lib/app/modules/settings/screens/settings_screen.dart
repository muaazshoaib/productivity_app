import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dnd/flutter_dnd.dart';

import '../../../utils/colors.dart';
import '../../../widgets/back_button.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_heading.dart';
import '../../authentication/screens/authentication_screen.dart';
import '../widgets/settings_container_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
            Row(
              children: [
                BackButtonWidget(
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                const Expanded(
                  child: MyHeading(text: "Settings"),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const SettingScreenContainer(text: "Personal Info"),
            const SizedBox(height: 15),
            SettingScreenContainer(
              text: "Notification Policy Access",
              onTap: () {
                FlutterDnd.gotoPolicySettings();
              },
            ),
            const SizedBox(height: 30),
            MyButton(
              buttonText: "Log Out",
              buttonColor: Colors.black,
              onTap: () async {
                await FirebaseAuth.instance.signOut().then(
                      (value) => Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const AuthenticationScreen(),
                        ),
                        (route) => false,
                      ),
                    );
              },
            ),
          ],
        ),
      ),
    );
  }
}
