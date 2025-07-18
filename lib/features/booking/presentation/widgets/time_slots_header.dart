import 'package:flutter/material.dart';
import 'package:doctor_booking1/core/responsive.dart';

class TimeSlotsHeader extends StatelessWidget {
  const TimeSlotsHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: context.screenHeight * 0.02),
        Text(
          'Available Time Slots:',
          style: TextStyle(
            fontSize: context.screenWidth * 0.045,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.screenHeight * 0.01),
      ],
    );
  }
}