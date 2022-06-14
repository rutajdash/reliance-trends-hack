import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:jio_fashion_hack/api/auth/user_model.dart';
import 'package:jio_fashion_hack/api/store/counter_model.dart';
import 'package:jio_fashion_hack/api/store/store_model.dart';
import 'package:jio_fashion_hack/components/dashboard/main_content.dart';
import 'package:jio_fashion_hack/components/shared/top_bar.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  late StoreModel store;
  final Stream<DocumentSnapshot> _storeStream = FirebaseFirestore.instance
      .collection('stores')
      .doc('4zZ4swptINnwP75V9LPE')
      .snapshots();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: _storeStream,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  TopBar(showBottomShadow: true),
                  Center(
                    child: Text('There was an error loading the data.',
                        style: TextStyle(
                            fontSize: 24, decoration: TextDecoration.none)),
                  )
                ],
              ),
            ),
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  TopBar(showBottomShadow: true),
                  Center(
                    child: SizedBox(
                        height: 48,
                        width: 48,
                        child: CircularProgressIndicator()),
                  )
                ],
              ),
            ),
          );
        } else {
          // List<CounterModel> counters = (snapshot.data!
          //         .get(FieldPath.fromString('counters')) as List<dynamic>)
          //     .cast<CounterModel>();
          List<CounterModel> counters = (snapshot.data!
                  .get(FieldPath.fromString('counters')) as List<dynamic>)
              .map((e) => CounterModel(
                  id: e['id'],
                  brandName: e['brandName'],
                  currentCount: e['currentCount'],
                  totalCount: e['totalCount']))
              .toList();
          StoreModel store = StoreModel(
              id: snapshot.data!.id,
              name: snapshot.data!.get(FieldPath.fromString('name')),
              location: snapshot.data!.get(FieldPath.fromString('location')),
              counters: counters);
          return Scaffold(
            body: Container(
              padding: const EdgeInsets.all(0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const TopBar(showBottomShadow: true),
                  Flexible(
                      flex: 1,
                      fit: FlexFit.loose,
                      child: MainDashboardContent(store: store))
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
