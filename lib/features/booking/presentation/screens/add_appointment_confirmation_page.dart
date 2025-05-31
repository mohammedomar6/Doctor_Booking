import 'package:doctor_booking1/core/responsive.dart';
import 'package:flutter/material.dart';

class AddAppointmentConfirmationPage extends StatelessWidget {
  final String doctorName;
  final String specialty;
  final String imagePath;

  const AddAppointmentConfirmationPage({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Appointment'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            const Divider(),
            SizedBox(height: context.screenHeight * 0.02),
            Text(
              'Appointment Date: Monday, 1 July\nTime: 09:00 - 10:00',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: context.screenWidth * 0.04,
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: context.screenHeight * 0.02,
                  ),
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Appointment Confirmed!')),
                  );
                  Navigator.pop(context);
                },
                child: const Text(
                  'Confirm Booking',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
