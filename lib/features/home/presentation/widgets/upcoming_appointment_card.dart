import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:flutter/material.dart';

class UpcomingAppointmentCard extends StatelessWidget {
  final String doctorName;
  final String imagePath;
  final String date;
  final String time;
  final String type;
  final VoidCallback? onCancel;

  const UpcomingAppointmentCard({
    super.key,
    required this.doctorName,
    required this.imagePath,
    required this.date,
    required this.time,
    required this.type,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColours.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(context.screenWidth * 0.03),
      ),
      child: Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.03),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  width: context.screenWidth * 0.15,
                  height: context.screenWidth * 0.15,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: context.screenWidth * 0.03),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        doctorName,
                        style: TextStyle(
                          color: MyColours.white,
                          fontWeight: FontWeight.bold,
                          fontSize: context.screenWidth * 0.04,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: context.screenHeight * 0.005),
                      Text(
                        type,
                        style: TextStyle(
                          color: MyColours.white.withOpacity(0.8),
                          fontSize: context.screenWidth * 0.035,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: context.screenHeight * 0.01),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today,
                            size: context.screenWidth * 0.04,
                            color: MyColours.white,
                          ),
                          SizedBox(width: context.screenWidth * 0.01),
                          Flexible(
                            child: Text(
                              date,
                              style: TextStyle(
                                color: MyColours.white,
                                fontSize: context.screenWidth * 0.03,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(width: context.screenWidth * 0.03),
                          Icon(
                            Icons.access_time,
                            size: context.screenWidth * 0.04,
                            color: MyColours.white,
                          ),
                          SizedBox(width: context.screenWidth * 0.01),
                          Flexible(
                            child: Text(
                              time,
                              style: TextStyle(
                                color: MyColours.white,
                                fontSize: context.screenWidth * 0.03,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            if (onCancel != null)
              Padding(
                padding: EdgeInsets.only(
                  top: context.screenHeight * 0.01,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: onCancel,
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.red[400],
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
                          color: Colors.white,
                          fontSize: context.screenWidth * 0.035,
                        ),
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
}