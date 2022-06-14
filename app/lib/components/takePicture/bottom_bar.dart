import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jio_fashion_hack/api/store/counter_model.dart';
import 'package:jio_fashion_hack/api/store/store_model.dart';
import 'package:jio_fashion_hack/utils/helpers/cameras_helper.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    required this.controller,
    required this.counterNumber,
    required this.incrementCounterNumber,
    required this.store,
  });

  final CameraController controller;
  final int counterNumber;
  final void Function() incrementCounterNumber;
  final StoreModel store;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  bool isButtonEnabled = true;

  Future<void> handleClick(BuildContext context) async {
    try {
      setState(() => isButtonEnabled = false);

      String downloadURL = await takePicture(
          widget.controller, widget.counterNumber, widget.store.id);

      // TODO: Send to API (or else use storage trigger)
      print(widget.store.id);
      List<CounterModel> counters = widget.store.counters;
      counters[widget.counterNumber].currentCount =
          Random().nextInt(counters[widget.counterNumber].totalCount);
      print(counters);
      await FirebaseFirestore.instance
          .collection('stores')
          .doc(widget.store.id)
          .update({
        "counters": [
          ...counters.map((e) => {
                "id": e.id,
                "brandName": e.brandName,
                "currentCount": e.currentCount,
                "totalCount": e.totalCount,
              })
        ]
      });

      if (widget.store.numberOfCounters - 1 > widget.counterNumber) {
        widget.incrementCounterNumber();
        setState(() => isButtonEnabled = true);
      } else {
        AutoRouter.of(context).replaceNamed('/dashboard');
      }
    } catch (error) {
      if (error == 'could-not-upload') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('The image could not be uploaded.')));
      } else if (error == 'could-not-capture-image') {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('The image could not be captured.')));
      } else {
        print(error);
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('An unexpected error occurred.')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(8),
      child: isButtonEnabled
          ? IconButton(
              icon: const Icon(
                Icons.camera,
                size: 48,
                color: Colors.white,
              ),
              onPressed: () => isButtonEnabled ? handleClick(context) : null)
          : Container(
              padding: const EdgeInsets.all(4),
              child: const SizedBox(
                  width: 40, height: 40, child: CircularProgressIndicator())),
    );
  }
}
