import 'package:flutter/material.dart';

class StoreOverview extends StatelessWidget {
  const StoreOverview(
      {Key? key,
      required this.storeName,
      required this.emptyProductCount,
      required this.totalProductCount})
      : super(key: key);

  final String storeName;
  final int emptyProductCount;
  final int totalProductCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Card(
          margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
            child: Text(storeName, style: const TextStyle(fontSize: 24)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Card(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Empty Products',
                        style: TextStyle(fontSize: 16)),
                    Text('$emptyProductCount',
                        style: const TextStyle(fontSize: 36)),
                  ],
                ),
              ),
            ),
            Card(
              margin: const EdgeInsets.fromLTRB(16, 8, 16, 8),
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text('Total Products',
                        style: TextStyle(fontSize: 16)),
                    Text('$totalProductCount',
                        style: const TextStyle(fontSize: 36)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
