import 'package:flutter/material.dart';
import 'package:doctor_booking1/core/responsive.dart';

class NoSlotsAvailable extends StatelessWidget {
  const NoSlotsAvailable({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'No available slots for this date',
        style: TextStyle(
          color: Colors.grey,
          fontSize: context.screenWidth * 0.04,
        ),
      ),
    );
  }
}