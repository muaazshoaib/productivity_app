import 'package:flutter/material.dart';
import 'package:productivity_app/app/utils/colors.dart';

import '../../habit_tracker/screens/habit_tracker_monthly_summary_screen.dart';

import '../../pomodoro_timer/screens/data.dart';

class AnalyticsScreen extends StatefulWidget {
  const AnalyticsScreen({super.key});

  @override
  State<AnalyticsScreen> createState() => _AnalyticsScreenState();
}

class _AnalyticsScreenState extends State<AnalyticsScreen> {
  int tabIndex = 0;

  final pages = [
    const Data(),
    const HabitTrackerMonthlySummaryScreen(),
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
            icon: Icon(Icons.timer),
            selectedIcon: Icon(
              Icons.timer,
              color: Colors.black,
            ),
            label: 'Pomodoro Analytics',
          ),
          NavigationDestination(
            icon: Icon(Icons.star),
            selectedIcon: Icon(
              Icons.star,
              color: Colors.black,
            ),
            label: 'Habit Tracker Analytics',
          ),
        ],
      ),
    );
  }
}
