import 'package:flutter/material.dart';
import 'package:doctor_booking1/constant/my_colours.dart';

class AvailableTimeSelector extends StatelessWidget {
  final List<String> times;
  final String? selectedTime;
  final Function(String) onSelected;

  const AvailableTimeSelector({
    super.key,
    this.times = const [
      '09:00 - 10:00',
      '10:00 - 11:00',
      '11:00 - 12:00',
      '13:00 - 14:00',
      '15:00 - 16:00',
    ],
    required this.selectedTime,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      children: times.map((time) {
        final isSelected = time == selectedTime;
        return ChoiceChip(
          label: Text(time),
          selected: isSelected,
          onSelected: (_) => onSelected(time),
          selectedColor: MyColours.blue,
          labelStyle:
              TextStyle(color: isSelected ? Colors.white : Colors.black),
        );
      }).toList(),
    );
  }
}
