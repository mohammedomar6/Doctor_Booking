import 'package:flutter/material.dart';
import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';

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
      padding: EdgeInsets.all(context.screenWidth * 0.02),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: context.screenWidth * 0.02,
        mainAxisSpacing: context.screenWidth * 0.02,
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
              borderRadius: BorderRadius.circular(context.screenWidth * 0.02),
            ),
            padding: EdgeInsets.symmetric(vertical: context.screenHeight * 0.01),
          ),
          onPressed: () {
            onTimeSelected(TimeOfDay(hour: slot.hour, minute: slot.minute));
          },
          child: Text(
            '${slot.hour}:${slot.minute.toString().padLeft(2, '0')}',
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: context.screenWidth * 0.035,
            ),
          ),
        );
      },
    );
  }
}