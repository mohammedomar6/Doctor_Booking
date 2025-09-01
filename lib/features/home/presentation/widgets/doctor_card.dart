import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/booking/presentation/blocs/available_booking/available_booking_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../booking/presentation/screens/add_appointment_confirmation_page.dart'
    show AddAppointmentConfirmationPage;

class DoctorCard extends StatelessWidget {
  final String name;
  final String doctorId;
  final int price;
  final String specialty;
  final String? image;

  const DoctorCard({
    super.key,
    required this.name,
    required this.specialty,
    this.image,
    required this.doctorId,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final priceFormatted =
        '${NumberFormat.decimalPattern('en_US').format(price)} SYP';

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
              child: _buildDoctorImage(context),
            ),
            SizedBox(width: context.screenWidth * 0.04),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(

                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: context.screenWidth * 0.042,
                        ),
                      ),

                    ],
                  ),
                  Text(
                    specialty,
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: context.screenWidth * 0.034,
                    ),
                  ),
                  SizedBox(height: context.screenHeight * 0.006),
                  Text(
                    'Price: $priceFormatted',
                    style: TextStyle(
                      color: MyColours.blue,
                      fontWeight: FontWeight.w700,
                      fontSize: context.screenWidth * 0.035,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [

                      Text(
                        "4.8",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: context.screenWidth * 0.034,
                        ),
                      ),
                      Icon(
                        Icons.star,
                        color: MyColours.star,
                        size: context.screenWidth * 0.045,
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
                  SizedBox(height: context.screenHeight * 0.015),
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
                              builder: (context) => BlocProvider(
                                create: (_) => AvailableBookingBloc()
                                  ..add(GetAvailableDatesEvent(doctorId)),
                                child: AddAppointmentConfirmationPage(
                                  doctorId: doctorId,
                                  price: price,
                                  doctorName: name,
                                  specialty: specialty,
                                  imagePath: image ?? "",
                                ),
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

  Widget _buildDoctorImage(BuildContext context) {
    if (image != null && image!.isNotEmpty) {
      return Image.network(
        image!,
        width: context.screenWidth * 0.18,
        height: context.screenWidth * 0.18,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return SizedBox(
            width: context.screenWidth * 0.18,
            height: context.screenWidth * 0.18,
            child: const Center(
              child: CircularProgressIndicator(strokeWidth: 2),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) =>
            _buildPlaceholder(context),
      );
    } else {
      return _buildPlaceholder(context);
    }
  }

  Widget _buildPlaceholder(BuildContext context) {
    return Container(
      width: context.screenWidth * 0.18,
      height: context.screenWidth * 0.18,
      color: Colors.grey[200],
      child: Icon(
        Icons.person,
        size: context.screenWidth * 0.1,
        color: Colors.grey[500],
      ),
    );
  }
}
