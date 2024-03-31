import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../utils/utils.dart';
import '../../../widgets/my_body_text.dart';
import '../../../widgets/my_button.dart';
import '../../../widgets/my_heading.dart';
import '../../../widgets/my_textfield.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordScreen> {
  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const MyHeading(text: 'Forgotten Password'),
                const SizedBox(height: 40),
                const MyBodyText(
                    text:
                        'Enter your email and we will send you a password reset link!'),
                const SizedBox(height: 20),
                MyTextField(
                  controller: emailController,
                  hintText: 'Email',
                  obscureText: false,
                ),
                const SizedBox(height: 20),
                MyButton(
                  buttonText: 'Reset Password',
                  buttonColor: Colors.black,
                  onTap: () async {
                    if (emailController.text.isNotEmpty) {
                      try {
                        await FirebaseAuth.instance.sendPasswordResetEmail(
                            email: emailController.text.trim());
                        if (context.mounted) {
                          Utils().showMessage(context,
                              'Password reset link sent to ${emailController.text.trim()}');
                        }
                      } on FirebaseAuthException catch (exception) {
                        if (context.mounted) {
                          Utils().showMessage(
                              context, exception.message.toString());
                        }
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
