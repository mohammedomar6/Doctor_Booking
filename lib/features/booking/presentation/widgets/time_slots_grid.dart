import 'package:flutter/material.dart';
import 'package:doctor_booking1/constant/my_colours.dart';

class TimeSlotsGrid extends StatelessWidget {
  final List<dynamic> availableSlots;
  final TimeOfDay? selectedTime;
  final Function(TimeOfDay) onTimeSelected;

  const TimeSlotsGrid({
    super.key,
    required this.availableSlots,
    required this.selectedTime,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        childAspectRatio: 2,
      ),
      itemCount: availableSlots.length,
      itemBuilder: (context, index) {
        final slot = availableSlots[index];
        final isSelected = selectedTime != null &&
            selectedTime!.hour == slot.hour &&
            selectedTime!.minute == slot.minute;

        return ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? MyColours.blue : Colors.grey[200],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.symmetric(vertical: 12),
          ),
          onPressed: () {
            onTimeSelected(TimeOfDay(hour: slot.hour, minute: slot.minute));
          },
          child: Text(
            '${slot.hour}:${slot.minute.toString().padLeft(2, '0')}',
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        );
      },
    );
  }
}
