import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import '../../../widgets/three_dimensional_container.dart';
import 'timer.dart';

class Habit extends StatelessWidget {
  const Habit({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController workController = TextEditingController();
    final TextEditingController breakController = TextEditingController();
    final TextEditingController sessionController = TextEditingController();

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: false,
            backgroundColor: kBackgroundColor,
            elevation: 0,
            title: const Text.rich(
              TextSpan(
                text: 'Start session', // text for title
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontFamily: 'Arial',
                ),
              ),
            )),
        body: SingleChildScrollView(
          child: Center(
            child: ThreeDimensionalContainer(
              width: MediaQuery.sizeOf(context).width / 1.2,
              child: (Container(
                width: double.infinity,
                color: kBackgroundColor,
                margin: const EdgeInsets.all(30),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Work duration",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Arial',
                      ),
                    ),
                    const SizedBox(
                        height:
                            10), // add a space between the text and the input field
                    TextField(
                      controller: workController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'Arial',
                      ),
                      keyboardType: TextInputType
                          .number, // set the keyboard type to number
                      keyboardAppearance: Brightness.dark,
                      decoration: const InputDecoration(
                        // filled: true,
                        fillColor: Colors.black12,
                        labelText: 'Enter in minutes',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                    const SizedBox(height: 25),
                    const Text(
                      "Break duration",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Arial',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: breakController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'Arial',
                      ),
                      keyboardType: TextInputType
                          .number, // set the keyboard type to number
                      keyboardAppearance: Brightness.dark,
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.transparent,
                        labelText: 'Enter in minutes',
                        labelStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                    const SizedBox(
                        height:
                            25), // add a space between the text and the input field
                    const Text(
                      "Sessions",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontFamily: 'Arial',
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: sessionController,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 13,
                        color: Colors.black,
                        fontFamily: 'Arial',
                      ),
                      keyboardType: TextInputType
                          .number, // set the keyboard type to number
                      keyboardAppearance: Brightness.dark,
                      decoration: const InputDecoration(
                        // filled: true,
                        fillColor: Colors.transparent,
                        labelText: 'Enter number of work sessions',
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4.0)),
                            borderSide: BorderSide(color: Colors.black)),
                      ),
                    ),
                    const SizedBox(
                        height:
                            80), // add a space between the text and the input field
                    TextButton(
                      onPressed: () => Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(seconds: 1),
                          pageBuilder:
                              (context, animation, secondaryAnimation) {
                            return FadeTransition(
                              opacity: animation,
                              child: MyTimer(
                                  breakTime: breakController.text,
                                  workTime: workController.text,
                                  workSessions: sessionController.text),
                            );
                          },
                        ),
                      ),
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(150, 50),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        alignment: Alignment.center,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: const BorderSide(
                              color: Colors.black12, width: 2.0),
                        ),
                      ),
                      child: const Text(
                        "Start",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Arial',
                        ),
                      ),
                    ),
                  ],
                ),
              )),
            ),
          ),
        ),
      ),
    );
  }
}
