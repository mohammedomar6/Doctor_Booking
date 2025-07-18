import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:doctor_booking1/core/responsive.dart';

class DatePickerTile extends StatelessWidget {
  final DateTime? selectedDate;
  final VoidCallback onTap;

  const DatePickerTile({
    super.key,
    required this.selectedDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.calendar_today,
        size: context.screenWidth * 0.06,
      ),
      title: Text(
        selectedDate == null
            ? 'Select Date'
            : DateFormat('EEEE, MMM d, yyyy').format(selectedDate!),
        style: TextStyle(fontSize: context.screenWidth * 0.04),
      ),
      trailing: Icon(
        Icons.arrow_drop_down,
        size: context.screenWidth * 0.06,
      ),
      onTap: onTap,
    );
  }
}