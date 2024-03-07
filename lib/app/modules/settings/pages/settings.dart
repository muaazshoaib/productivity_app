import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:productivity_app/app/modules/authentication/pages/authentication.dart';
import 'package:productivity_app/app/widgets/my_button.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Settings',
          style: Theme.of(context).textTheme.displayLarge,
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton(
                buttonText: "Notification Policy Access",
                onTap: () {
                  //  FlutterDnd.gotoPolicySettings();
                },
              ),
              const SizedBox(height: 20),
              const MyButton(
                buttonText: "Functions",
              ),
              const SizedBox(height: 20),
              const MyButton(
                buttonText: "Project on GitHub",
              ),
              const SizedBox(height: 40),
              MyButton(
                buttonText: "Log Out",
                buttonColor: Colors.red,
                onTap: () async {
                  await FirebaseAuth.instance.signOut().then(
                        (value) => Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (context) => const AuthenticationPage(),
                          ),
                          (route) => false,
                        ),
                      );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
