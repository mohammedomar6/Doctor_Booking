import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      title: const Text('Confirm Payment'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Do you agree to pay $amount for the appointment?'),
          const SizedBox(height: 12),
          Text(
            '📅 Date: $formattedDate',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(
            '⏰ Time: $selectedTime',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(false),
          child: const Text('No'),
        ),
        TextButton(
          onPressed: () => Navigator.of(context).pop(true),
          child: const Text('Yes'),
        ),
      ],
    ),
  );
}
