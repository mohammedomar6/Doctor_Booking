import 'package:flutter/material.dart';

class NoSlotsAvailable extends StatelessWidget {
  const NoSlotsAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No available slots for this date',
        style: TextStyle(
          color: Colors.grey,
          fontSize: 16,
        ),
      ),
    );
  }
}