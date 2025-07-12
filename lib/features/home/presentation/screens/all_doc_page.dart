import 'package:doctor_booking1/constant/my_images.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/home/presentation/bloc/home_bloc.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllDoctorsPage extends StatelessWidget {
  const AllDoctorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All Doctors"),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state.docStatus == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.docStatus == Status.failed) {
            return const Center(child: Text("Failed to fetch doctors"));
          } else if (state.docStatus == Status.success) {
            return ListView.builder(
              padding: EdgeInsets.all(16),
              itemCount: state.doctorModelList.length,
              itemBuilder: (context, index) {
                final doc = state.doctorModelList[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: context.screenHeight * 0.02),
                  child: DoctorCard(
                    name: "Dr. ${doc.firstName} ${doc.lastName}",
                    specialty: doc.departmentName,
                    image: MyImages.doc3,
                    doctorId: doc.id,
                  ),
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
