import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  @override
  Widget build(BuildContext context) {
    return BarChart(
      BarChartData(
          alignment: BarChartAlignment.center,
          maxY: 4.0,
          groupsSpace: 12,
          barTouchData: BarTouchData(enabled: true),
          barGroups: [
            BarChartGroupData(
              x: 3,
            ),
          ]),
      swapAnimationDuration: const Duration(seconds: 3),
      swapAnimationCurve: Curves.linear,
    );
  }
}
