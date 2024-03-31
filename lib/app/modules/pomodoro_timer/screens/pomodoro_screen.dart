import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../../../utils/colors.dart';
import 'data.dart';
import 'habit.dart';
import 'settings.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({Key? key}) : super(key: key);

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  int index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      bottomNavigationBar: CurvedNavigationBar(
        height: 75,
        animationCurve: Curves.easeInOut,
        backgroundColor: Colors.grey.shade300,
        buttonBackgroundColor: kBackgroundColor,
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 350),
        onTap: (selectedIndex) {
          setState(() {
            index = selectedIndex;
          });
        },
        index: 1,
        items: const [
          Icon(Icons.timelapse_rounded, size: 20, color: Colors.white),
          Icon(Icons.fitbit_rounded, size: 20, color: Colors.white),
          Icon(Icons.history_rounded, size: 20, color: Colors.white),
        ],
      ),
      body: Container(
        child: getSelectedWidget(index: index),
      ),
    );
  }

  Widget getSelectedWidget({required int index}) {
    switch (index) {
      case 0:
        return const Data();
      case 2:
        return const Settings();
      default:
        return const Habit();
    }
  }
}
