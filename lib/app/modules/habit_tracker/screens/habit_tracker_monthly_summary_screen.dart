import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../data/habit_database.dart';

import '../widgets/month_summary.dart';

class HabitTrackerMonthlySummaryScreen extends StatefulWidget {
  const HabitTrackerMonthlySummaryScreen({super.key});

  @override
  State<HabitTrackerMonthlySummaryScreen> createState() =>
      _HabitTrackerMonthlySummaryScreenState();
}

class _HabitTrackerMonthlySummaryScreenState
    extends State<HabitTrackerMonthlySummaryScreen> {
  HabitDatabase db = HabitDatabase();
  final _myBox = Hive.box("Habit_Database");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Habit Tracker Analytics'),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: MonthlySummary(
          datasets: db.heatMapDataSet,
          startDate: _myBox.get("START_DATE"),
        ),
      ),
    );
  }
}
