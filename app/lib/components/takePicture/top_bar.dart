import 'package:flutter/material.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.counterNumber,
    required this.brandName,
  });

  final int counterNumber;
  final String brandName;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Text('Counter $counterNumber: $brandName',
          style: const TextStyle(fontSize: 24, color: Colors.white)),
    );
  }
}
