import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:flutter/material.dart';

class UpcomingAppointmentCard extends StatelessWidget {
  final String doctorName;
  final String imagePath;
  final String date;
  final String time;
  final String type;

  const UpcomingAppointmentCard({
    super.key,
    required this.doctorName,
    required this.imagePath,
    required this.date,
    required this.time,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MyColours.blue,
        borderRadius: BorderRadius.circular(
          context.screenWidth * 0.035,
        ),
      ),
      padding: EdgeInsets.all(
        context.screenWidth * 0.035,
      ),
      child: ListTile(
        leading: CircleAvatar(
          radius: context.screenWidth * 0.065,
          backgroundImage: AssetImage(
            imagePath,
          ),
        ),
        title: Text(
          doctorName,
          style: TextStyle(
            color: MyColours.white,
            fontWeight: FontWeight.bold,
            fontSize: context.screenWidth * 0.038,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              type,
              style: TextStyle(
                color: Colors.white70,
                fontSize: context.screenWidth * 0.032,
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.015,
            ),
            Row(
              children: [
                Icon(
                  Icons.calendar_today,
                  size: context.screenWidth * 0.034,
                  color: MyColours.white,
                ),
                SizedBox(
                  width: context.screenWidth * 0.015,
                ),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: context.screenWidth * 0.03,
                    color: MyColours.white,
                  ),
                ),
                SizedBox(
                  width: context.screenWidth * 0.025,
                ),
                Icon(
                  Icons.access_time,
                  size: context.screenWidth * 0.034,
                  color: MyColours.white,
                ),
                SizedBox(
                  width: context.screenWidth * 0.015,
                ),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: context.screenWidth * 0.03,
                    color: MyColours.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
