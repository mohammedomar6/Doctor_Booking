import 'package:doctor_booking1/constant/my_colours.dart';
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
          ),
        ),
      ),
      body: BlocBuilder<AvailableBookingBloc, AvailableBookingState>(
        builder: (context, state) {
          if (state.userStatus == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.userStatus == Status.failed) {
            return const Center(child: Text("Failed to load appointments"));
          } else if (state.userStatus == Status.success) {
            return ListView.builder(
              itemCount: state.appointments.length,
              itemBuilder: (context, index) {
                final appointment = state.appointments[index];
                return AppointmentCard(appointment: appointment);
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
