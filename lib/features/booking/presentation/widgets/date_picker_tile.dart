import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
      leading: const Icon(Icons.calendar_today),
      title: Text(
        selectedDate == null
            ? 'Select Date'
            : DateFormat('EEEE, MMM d, yyyy').format(selectedDate!),
      ),
      trailing: const Icon(Icons.arrow_drop_down),
      onTap: onTap,
    );
  }
}
