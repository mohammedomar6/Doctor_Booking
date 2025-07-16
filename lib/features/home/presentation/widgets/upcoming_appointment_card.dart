import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

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
    return Card(
      color: MyColours.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.sp),
      ),
      child: Padding(
        padding: EdgeInsets.all(12.sp),
        child: Row(
          children: [
            Container(
              width: 60.sp,
              height: 60.sp,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorName,
                    style: TextStyle(
                      color: MyColours.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4.sp),
                  Text(
                    type,
                    style: TextStyle(
                      color: MyColours.white.withOpacity(0.8),
                      fontSize: 14.sp,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8.sp),
                  Row(
                    children: [
                      Icon(
                        Icons.calendar_today,
                        size: 16.sp,
                        color: MyColours.white,
                      ),
                      SizedBox(width: 4.sp),
                      Flexible(
                        child: Text(
                          date,
                          style: TextStyle(
                            color: MyColours.white,
                            fontSize: 12.sp,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 12.sp),
                      Icon(
                        Icons.access_time,
                        size: 16.sp,
                        color: MyColours.white,
                      ),
                      SizedBox(width: 4.sp),
                      Flexible(
                        child: Text(
                          time,
                          style: TextStyle(
                            color: MyColours.white,
                            fontSize: 12.sp,
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
      ),
    );
  }
}