import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/booking/presentation/blocs/available_booking/available_booking_bloc.dart';
import 'package:doctor_booking1/features/booking/presentation/widgets/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';

class MyBooking extends StatelessWidget {
  const MyBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'My Appointments',
          style: TextStyle(
            color: MyColours.black,
            fontSize: context.screenWidth * 0.045,
          ),
        ),
      ),
      body: BlocBuilder<AvailableBookingBloc, AvailableBookingState>(
        builder: (context, state) {
          if (state.userStatus == Status.loading) {
            return Center(
              child: CircularProgressIndicator(
                strokeWidth: context.screenWidth * 0.01,
              ),
            );
          } else if (state.userStatus == Status.failed) {
            return Center(
              child: Text(
                "Failed to load appointments",
                style: TextStyle(fontSize: context.screenWidth * 0.04),
              ),
            );
          } else if (state.userStatus == Status.success) {
            return ListView.builder(
              padding: EdgeInsets.all(context.screenWidth * 0.03),
              itemCount: state.appointments.length,
              itemBuilder: (context, index) {
                final appointment = state.appointments[index];
                return AppointmentCard(
                  appointment: appointment,
                  onCancel: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: Text(
                          'Cancel Appointment',
                          style: TextStyle(fontSize: context.screenWidth * 0.045),
                        ),
                        content: Text(
                          'Are you sure you want to cancel this appointment?',
                          style: TextStyle(fontSize: context.screenWidth * 0.04),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              'No',
                              style: TextStyle(fontSize: context.screenWidth * 0.04),
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              // استدعاء API لإلغاء الموعد هنا
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'Appointment cancelled successfully',
                                    style: TextStyle(fontSize: context.screenWidth * 0.04),
                                  ),
                                ),
                              );
                            },
                            child: Text(
                              'Yes',
                              style: TextStyle(
                                fontSize: context.screenWidth * 0.04,
                                color: Colors.red,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}