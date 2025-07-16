import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_images.dart';
import 'package:doctor_booking1/features/booking/data/models/user_appointment_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class AppointmentCard extends StatelessWidget {
  final UserAppointmentModel appointment;

  const AppointmentCard({super.key, required this.appointment});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: MyColours.blue,
      margin: EdgeInsets.all(12.sp),
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(MyImages.doc2),
        ),
        title: Text(
          "Dr. ${appointment.doctor.firstName} ${appointment.doctor.lastName}",
          style: TextStyle(color: MyColours.white),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(DateFormat('EEEE, d MMMM').format(appointment.date),
                style: TextStyle(color: MyColours.white)),
            Text(
                '${appointment.hour}:${appointment.minute.toString().padLeft(2, '0')}',
                style: TextStyle(color: MyColours.white)),
          ],
        ),
        trailing: Column(
          children: [
            Text(appointment.doctor.department,
                style: TextStyle(color: MyColours.white, fontSize: 14.sp)),
            SizedBox(
              height: 10.h,
            ),
            Text('\$${appointment.fees}',
                style: TextStyle(color: MyColours.white, fontSize: 14.sp)),
          ],
        ),
      ),
    );
  }
}
