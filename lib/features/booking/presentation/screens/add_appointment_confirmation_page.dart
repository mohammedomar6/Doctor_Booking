import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddAppointmentConfirmationPage extends StatefulWidget {
  final String doctorName;
  final String specialty;
  final String imagePath;

  const AddAppointmentConfirmationPage({
    super.key,
    required this.doctorName,
    required this.specialty,
    required this.imagePath,
  });

  @override
  State<AddAppointmentConfirmationPage> createState() =>
      _AddAppointmentConfirmationPageState();
}

class _AddAppointmentConfirmationPageState
    extends State<AddAppointmentConfirmationPage> {
  DateTime? selectedDate;
  String? selectedTime;

  final List<String> availableTimes = [
    '09:00 - 10:00',
    '10:00 - 11:00',
    '11:00 - 12:00',
    '13:00 - 14:00',
    '15:00 - 16:00',
  ];

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Appointment'),
        backgroundColor: MyColours.white,
        foregroundColor: MyColours.black,
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(context.screenWidth * 0.04),
              child: Image.asset(
                widget.imagePath,
                width: context.screenWidth * 0.4,
                height: context.screenWidth * 0.4,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.03),
            Text(
              widget.doctorName,
              style: TextStyle(
                fontSize: context.screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: context.screenHeight * 0.01),
            Text(
              widget.specialty,
              style: TextStyle(
                fontSize: context.screenWidth * 0.04,
                color: Colors.grey[700],
              ),
            ),
            SizedBox(height: context.screenHeight * 0.04),
            const Divider(),
            SizedBox(height: context.screenHeight * 0.02),
            ListTile(
              leading: const Icon(Icons.calendar_today),
              title: Text(selectedDate == null
                  ? 'Select Appointment Date'
                  : DateFormat('EEEE, d MMM yyyy').format(selectedDate!)),
              trailing: const Icon(Icons.edit),
              onTap: pickDate,
            ),
            SizedBox(height: context.screenHeight * 0.02),
            Wrap(
              spacing: 12,
              children: availableTimes.map((time) {
                final isSelected = time == selectedTime;
                return ChoiceChip(
                  label: Text(time),
                  selected: isSelected,
                  onSelected: (_) => setState(() => selectedTime = time),
                  selectedColor: MyColours.blue,
                  labelStyle: TextStyle(
                      color: isSelected ? MyColours.white : MyColours.black),
                );
              }).toList(),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(
                    vertical: context.screenHeight * 0.02,
                  ),
                  backgroundColor: selectedDate != null && selectedTime != null
                      ? MyColours.blue
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: selectedDate != null && selectedTime != null
                    ? () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Appointment confirmed on ${DateFormat('d MMM yyyy').format(selectedDate!)} at $selectedTime'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                    : null,
                child: Text(
                  'Confirm Booking',
                  style: TextStyle(color: MyColours.white, fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
