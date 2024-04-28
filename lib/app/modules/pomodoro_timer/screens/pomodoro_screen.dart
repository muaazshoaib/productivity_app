import 'package:flutter/material.dart';
import 'package:productivity_app/app/utils/colors.dart';

import '../../pomodoro_timer/screens/data.dart';
import 'habit.dart';
import 'settings.dart';

class PomodoroScreen extends StatefulWidget {
  const PomodoroScreen({super.key});

  @override
  State<PomodoroScreen> createState() => _PomodoroScreenState();
}

class _PomodoroScreenState extends State<PomodoroScreen> {
  int tabIndex = 1;

  final pages = [
    const Data(),
    const Habit(),
    const Settings(),
  ];

  void changeTabIndex(int index) {
    setState(() {
      tabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: tabIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: kBackgroundColor,
        onDestinationSelected: (int index) => changeTabIndex(index),
        selectedIndex: tabIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.timelapse_rounded),
            selectedIcon: Icon(
              Icons.timelapse_rounded,
              color: Colors.black,
            ),
            label: 'Analytics',
          ),
          NavigationDestination(
            icon: Icon(Icons.fitbit_rounded),
            selectedIcon: Icon(
              Icons.fitbit_rounded,
              color: Colors.black,
            ),
            label: 'Pomodoro',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_rounded),
            selectedIcon: Icon(
              Icons.history_rounded,
              color: Colors.black,
            ),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
