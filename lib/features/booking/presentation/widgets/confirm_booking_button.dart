import 'package:flutter/material.dart';
import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';

class ConfirmBookingButton extends StatelessWidget {
  final bool isEnabled;
  final bool isProcessing;
  final VoidCallback onPressed;

  const ConfirmBookingButton({
    super.key,
    required this.isEnabled,
    required this.isProcessing,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isEnabled ? onPressed : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? MyColours.blue : Colors.grey,
          padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.02),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(context.screenWidth * 0.03),
          ),
        ),
        child: isProcessing
            ? SizedBox(
          width: context.screenWidth * 0.06,
          height: context.screenWidth * 0.06,
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: context.screenWidth * 0.005,
          ),
        )
            : Text(
          'Confirm Booking',
          style: TextStyle(
            color: Colors.white,
            fontSize: context.screenWidth * 0.04,
          ),
        ),
      ),
    );
  }
}