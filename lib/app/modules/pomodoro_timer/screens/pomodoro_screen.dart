import 'package:flutter/material.dart';
import 'package:fyp/app/modules/pomodoro_timer/screens/data.dart';
import 'package:fyp/app/modules/pomodoro_timer/screens/habit.dart';
import 'package:fyp/app/modules/pomodoro_timer/screens/settings.dart';

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
      backgroundColor: Colors.grey[300],
      body: IndexedStack(
        index: tabIndex,
        children: pages,
      ),
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.transparent,
        onDestinationSelected: (int index) => changeTabIndex(index),
        selectedIndex: tabIndex,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.timelapse_outlined),
            selectedIcon: Icon(
              Icons.timelapse_rounded,
              // color: Colors.black,
            ),
            label: 'Analytics',
          ),
          NavigationDestination(
            icon: Icon(Icons.fitbit_outlined),
            selectedIcon: Icon(
              Icons.fitbit_rounded,
              // color: Colors.black,
            ),
            label: 'Pomodoro',
          ),
          NavigationDestination(
            icon: Icon(Icons.history_outlined),
            selectedIcon: Icon(
              Icons.history_rounded,
              // color: Colors.black,
            ),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
