import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:flutter/material.dart';

import '../../../booking/presentation/screens/add_appointment_confirmation_page.dart'
    show AddAppointmentConfirmationPage;

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String image;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: EdgeInsets.symmetric(
        vertical: context.screenHeight * 0.015,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          context.screenWidth * 0.03,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(
          context.screenWidth * 0.035,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                context.screenWidth * 0.025,
              ),
              child: Image.asset(
                image,
                width: context.screenWidth * 0.18,
                height: context.screenWidth * 0.18,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: context.screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: context.screenWidth * 0.042,
                    ),
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.005,
                  ),
                  Text(
                    specialty,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: context.screenWidth * 0.034,
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.006),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: MyColours.star,
                        size: context.screenWidth * 0.045,
                      ),
                      SizedBox(
                        width: context.screenWidth * 0.01,
                      ),
                      Text(
                        "4.8",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: context.screenWidth * 0.034,
                        ),
                      ),
                      Text(
                        " (49 Reviews)",
                        style: TextStyle(
                          fontSize: context.screenWidth * 0.03,
                          color: MyColours.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: context.screenHeight * 0.015,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: MyColours.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              context.screenWidth * 0.05,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(
                            horizontal: context.screenWidth * 0.06,
                            vertical: context.screenHeight * 0.012,
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  AddAppointmentConfirmationPage(
                                doctorName: name,
                                specialty: specialty,
                                imagePath: image,
                              ),
                            ),
                          );
                        },
                        child: Text(
                          "Make Appointment",
                          style: TextStyle(
                            color: MyColours.white,
                            fontSize: context.screenWidth * 0.033,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
