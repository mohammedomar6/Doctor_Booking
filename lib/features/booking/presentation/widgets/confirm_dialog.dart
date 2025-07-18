import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:doctor_booking1/core/responsive.dart';

Future<bool?> showConfirmDialog(
    BuildContext context, {
      required int amount,
      required DateTime selectedDate,
      required String selectedTime,
    }) {
  final formattedDate = DateFormat('EEEE, d MMMM yyyy').format(selectedDate);

  return showDialog<bool>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text(
        'Confirm Payment',
        style: TextStyle(fontSize: context.screenWidth * 0.045),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Do you agree to pay $amount for the appointment?',
            style: TextStyle(fontSize: context.screenWidth * 0.04),
          ),
          SizedBox(height: context.screenHeight * 0.02),
          Text(
            '📅 Date: $formattedDate',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.screenWidth * 0.038,
            ),
          ),
          SizedBox(height: context.screenHeight * 0.01),
          Text(
            '⏰ Time: $selectedTime',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: context.screenWidth * 0.038,
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: Text(
            'No',
            style: TextStyle(fontSize: context.screenWidth * 0.04),
          ),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: Text(
            'Yes',
            style: TextStyle(fontSize: context.screenWidth * 0.04),
          ),
        ),
      ],
    ),
  );
}