import 'package:flutter/material.dart';

class TimeSlotsHeader extends StatelessWidget {
  const TimeSlotsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 16),
        Text(
          'Available Time Slots:',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}