import 'package:flutter/material.dart';

import '../../../utils/utils.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_heading.dart';
import '../../authentication/screens/login_or_register_screen.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = Utils().getScreenSize();
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: screenSize.height * 0.03),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: MyHeading(
                text: 'Unlock Your Productivity Potential',
              ),
            ),
            SizedBox(height: screenSize.height * 0.08),
            const Image(
              alignment: Alignment.center,
              height: 300,
              width: 300,
              image: AssetImage(
                'assets/images/background-image.png',
              ),
            ),
            SizedBox(height: screenSize.height * 0.08),
            MyButton(
              buttonText: "Let's Start",
              buttonColor: Colors.black,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginOrRegisterScreen(),
                  ),
                );
              },
            ),
            SizedBox(height: screenSize.height * 0.03),
          ],
        ),
      ),
    );
  }
}
