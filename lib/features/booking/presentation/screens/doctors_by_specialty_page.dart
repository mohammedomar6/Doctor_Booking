import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_images.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/home/presentation/bloc/home_bloc.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsBySpecialtyPage extends StatelessWidget {
  final String specialty;

  const DoctorsBySpecialtyPage({super.key, required this.specialty});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          specialty,
          style: TextStyle(color: MyColours.black),
        ),
        backgroundColor: MyColours.white,
        elevation: 0,
        iconTheme: IconThemeData(color: MyColours.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.04),
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.docStatus == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.docStatus == Status.failed) {
              return const Center(child: Text("Failed to load doctors"));
            } else if (state.docStatus == Status.success) {
              final doctors = state.doctorModelList
                  .where((doc) => doc.departmentName == specialty)
                  .toList();
              if (doctors.isEmpty) {
                return const Center(
                    child: Text("No doctors found for this specialty."));
              }
              return ListView.builder(
                itemCount: doctors.length,
                itemBuilder: (context, index) {
                  final doc = doctors[index];
                  return Padding(
                    padding:
                        EdgeInsets.only(bottom: context.screenHeight * 0.02),
                    child: DoctorCard(
                      name: "Dr. ${doc.firstName} ${doc.lastName}",
                      specialty: doc.departmentName,
                      image: MyImages.doc1,
                    ),
                  );
                },
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
