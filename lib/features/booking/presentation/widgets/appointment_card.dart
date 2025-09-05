import 'dart:io';

import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/booking/data/models/user_appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentCard extends StatelessWidget {
  final UserAppointmentModel appointment;
  final VoidCallback? onCancel;

  const AppointmentCard({
    super.key,
    required this.appointment,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColours.blue,
      margin: EdgeInsets.all(context.screenWidth * 0.03),
      child: Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.02),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(
                horizontal: context.screenWidth * 0.02,
                vertical: context.screenHeight * 0.01,
              ),
              leading: CircleAvatar(
                radius: context.screenWidth * 0.06,
                child: ClipOval(
                  child: _buildDoctorImage(),
                ),
              ),
              title: Text(
                "Dr. ${appointment.doctor.firstName} ${appointment.doctor.lastName}",
                style: TextStyle(
                  color: MyColours.white,
                  fontSize: context.screenWidth * 0.04,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    DateFormat('EEEE, d MMMM').format(appointment.date),
                    style: TextStyle(
                      color: MyColours.white,
                      fontSize: context.screenWidth * 0.035,
                    ),
                  ),
                  Text(
                    '${appointment.hour}:${appointment.minute.toString().padLeft(2, '0')}',
                    style: TextStyle(
                      color: MyColours.white,
                      fontSize: context.screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    appointment.doctor.department,
                    style: TextStyle(
                      color: MyColours.white,
                      fontSize: context.screenWidth * 0.035,
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.01),
                  Text(
                    '\$${appointment.fees}',
                    style: TextStyle(
                      color: MyColours.white,
                      fontSize: context.screenWidth * 0.035,
                    ),
                  ),
                ],
              ),
            ),
            if (onCancel != null)
              Padding(
                padding: EdgeInsets.only(
                  bottom: context.screenHeight * 0.01,
                  right: context.screenWidth * 0.03,
                ),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: onCancel,
                    style: TextButton.styleFrom(
                      backgroundColor: MyColours.white,
                      padding: EdgeInsets.symmetric(
                        horizontal: context.screenWidth * 0.04,
                        vertical: context.screenHeight * 0.005,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          context.screenWidth * 0.02,
                        ),
                      ),
                    ),
                    child: Text(
                      'Cancel Appointment',
                      style: TextStyle(
                        color: MyColours.blue,
                        fontSize: context.screenWidth * 0.035,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDoctorImage() {
    final image = appointment.doctor.image;

    if (image != null && image.isNotEmpty) {
      if (image.startsWith("http")) {
        return Image.network(
          image,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.person, color: MyColours.blue, size: 40),
        );
      } else {
        return Image.file(
          File(image),
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) =>
              Icon(Icons.person, color: MyColours.blue, size: 40),
        );
      }
    } else {
      return Icon(
        Icons.person,
        color: MyColours.white,
        size: 40,
      );
    }
  }
}
