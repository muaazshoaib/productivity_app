import 'package:flutter/material.dart';

import '../../habit_tracker/screens/habit_tracker_monthly_summary_screen.dart';

import '../../pomodoro_timer/screens/data.dart';
import 'package:fyp/app/modules/step_count/pages/step_count.dart';

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
    const StepCountPage(),
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
            icon: Icon(Icons.timer),
            selectedIcon: Icon(
              Icons.timer,
              // color: Colors.black,
            ),
            label: 'Pomodoro',
          ),
          NavigationDestination(
            icon: Icon(Icons.star),
            selectedIcon: Icon(
              Icons.star,
              // color: Colors.black,
            ),
            label: 'Habit Tracker',
          ),
          NavigationDestination(
            icon: Icon(Icons.directions_walk),
            selectedIcon: Icon(
              Icons.directions_walk,
              // color: Colors.black,
            ),
            label: 'Step Count',
          ),
        ],
      ),
    );
  }
}
