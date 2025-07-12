import 'package:doctor_booking1/core/responsive.dart';
import 'package:flutter/material.dart';

class DoctorHeader extends StatelessWidget {
  final String imagePath;
  final String doctorName;
  final String specialty;

  const DoctorHeader({
    super.key,
    required this.imagePath,
    required this.doctorName,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.04),
          child: Image.asset(
            imagePath,
            width: context.screenWidth * 0.4,
            height: context.screenWidth * 0.4,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: context.screenHeight * 0.03),
        Text(
          doctorName,
          style: TextStyle(
            fontSize: context.screenWidth * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.screenHeight * 0.01),
        Text(
          specialty,
          style: TextStyle(
            fontSize: context.screenWidth * 0.04,
            color: Colors.grey[700],
          ),
        ),
        SizedBox(height: context.screenHeight * 0.04),
      ],
    );
  }
}