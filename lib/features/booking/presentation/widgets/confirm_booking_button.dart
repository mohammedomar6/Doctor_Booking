import 'package:flutter/material.dart';
import 'package:doctor_booking1/constant/my_colours.dart';

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
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: isProcessing
            ? const SizedBox(
                width: 24,
                height: 24,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
            : const Text(
                'Confirm Booking',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
      ),
    );
  }
}
