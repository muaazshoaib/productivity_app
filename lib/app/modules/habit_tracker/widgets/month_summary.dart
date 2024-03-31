import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class MonthlySummary extends StatelessWidget {
  final Map<DateTime, int>? datasets;
  final String startDate;

  const MonthlySummary({
    super.key,
    required this.datasets,
    required this.startDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: HeatMap(
        // startDate: createDateTimeObject(startDate),
        startDate: DateTime.utc(2023, 11, 1),
        // endDate: DateTime.now().add(const Duration(days: 0)),
        endDate: DateTime.utc(2023, 12, 30),
        datasets: datasets,
        colorMode: ColorMode.color,
        defaultColor: Colors.grey[200],
        textColor: Colors.green,
        showColorTip: false,
        showText: true,
        scrollable: true,
        size: 30,
        colorsets: {
          1: Colors.grey.shade50,
          2: Colors.grey.shade100,
          3: Colors.grey.shade200,
          4: Colors.grey.shade300,
          5: Colors.grey.shade400,
          6: Colors.grey.shade500,
          7: Colors.grey.shade600,
          8: Colors.grey.shade700,
          9: Colors.grey.shade800,
          10: Colors.grey.shade900,
        },
        onClick: (value) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(value.toString())));
        },
      ),
    );
  }
}
