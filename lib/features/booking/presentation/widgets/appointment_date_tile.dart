import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentDateTile extends StatelessWidget {
  final DateTime? selectedDate;
  final VoidCallback onTap;

  const AppointmentDateTile({
    super.key,
    required this.selectedDate,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.calendar_today),
      title: Text(selectedDate == null
          ? 'اختر تاريخ الحجز'
          : DateFormat('EEEE, d MMM yyyy').format(selectedDate!)),
      trailing: const Icon(Icons.edit),
      onTap: onTap,
    );
  }
}
