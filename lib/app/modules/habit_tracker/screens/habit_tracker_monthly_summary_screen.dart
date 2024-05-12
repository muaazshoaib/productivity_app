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
  void initState() {
    // if there is no current habit list, then it is the 1st time ever opening the app
    // then create default data
    if (_myBox.get("CURRENT_HABIT_LIST") == null) {
      db.createDefaultData();
    }

    // there already exists data, this is not the first time
    else {
      db.loadData();
    }

    // update the database
    db.updateDatabase();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Habit Tracker Analytics",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
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
