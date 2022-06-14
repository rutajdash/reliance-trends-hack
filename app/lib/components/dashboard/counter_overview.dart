import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class CounterOverview extends StatelessWidget {
  const CounterOverview({
    Key? key,
    required this.counterNumber,
    required this.brandName,
    required this.pieChartSectionData,
  }) : super(key: key);

  final int counterNumber;
  final String brandName;
  final List<PieChartSectionData> pieChartSectionData;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('Counter $counterNumber',
                    style: const TextStyle(fontSize: 24)),
                Text(brandName, style: const TextStyle(fontSize: 24)),
              ],
            ),
            SizedBox(
              height: 125,
              width: 100,
              child: Expanded(
                child: PieChart(PieChartData(
                    centerSpaceRadius: 10,
                    sectionsSpace: 4,
                    sections: pieChartSectionData)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
