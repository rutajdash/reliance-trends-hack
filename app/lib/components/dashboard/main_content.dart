import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jio_fashion_hack/api/store/store_model.dart';
import 'package:jio_fashion_hack/components/dashboard/counter_overview.dart';
import 'package:jio_fashion_hack/components/dashboard/store_overview.dart';

class MainDashboardContent extends StatelessWidget {
  const MainDashboardContent({
    Key? key,
    required this.store,
  }) : super(key: key);

  final StoreModel store;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.max,
        children: [
          StoreOverview(
              storeName: store.name,
              emptyProductCount: store.totalProducts - store.currentProducts,
              totalProductCount: store.totalProducts),
          ...store.counters
              .map((counter) => CounterOverview(
                      counterNumber: counter.id,
                      brandName: counter.brandName,
                      pieChartSectionData: [
                        PieChartSectionData(
                          value: counter.totalCount.toDouble(),
                          title: '${100 - counter.emptyPercentage.floor()}%',
                          color: Color.fromARGB(255, 218, 30, 30),
                        ),
                        PieChartSectionData(
                          value: (counter.totalCount - counter.currentCount)
                              .toDouble(),
                          title: '${counter.emptyPercentage.floor()}%',
                          color: Color.fromARGB(255, 5, 160, 13),
                        ),
                      ]))
              .toList(),
        ],
      ),
    );
  }
}
