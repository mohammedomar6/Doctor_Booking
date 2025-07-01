import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/booking/presentation/blocs/departments/departments_bloc.dart';
import 'package:doctor_booking1/features/booking/presentation/screens/doctors_by_specialty_page.dart';
import 'package:doctor_booking1/helper/get_icon_for_department.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookingPage extends StatelessWidget {
  const BookingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Choose Specialty",
          style: TextStyle(
            color: MyColours.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: MyColours.white,
        elevation: 0,
        iconTheme: IconThemeData(color: MyColours.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.04),
        child: BlocBuilder<DepartmentsBloc, DepartmentsState>(
          builder: (context, state) {
            if (state.depStatusBook == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.depStatusBook == Status.failed) {
              return const Center(child: Text("Failed to load departments"));
            } else if (state.depStatusBook == Status.success) {
              final departments = state.departmentListBook;
              return GridView.builder(
                itemCount: departments.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: context.screenWidth * 0.04,
                  mainAxisSpacing: context.screenWidth * 0.02,
                  childAspectRatio: 1,
                ),
                itemBuilder: (context, index) {
                  final dep = departments[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) =>
                              DoctorsBySpecialtyPage(specialty: dep.name),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            radius: context.screenWidth * 0.1,
                            backgroundColor: Colors.blue.shade100,
                            child: FaIcon(
                              getIconForDepartment(dep.name),
                              color: MyColours.blue,
                              size: context.screenWidth * 0.08,
                            ),
                          ),
                          SizedBox(height: context.screenHeight * 0.015),
                          Text(
                            dep.name,
                            style: TextStyle(
                              fontSize: context.screenWidth * 0.04,
                              fontWeight: FontWeight.w600,
                              color: MyColours.black,
                            ),
                          ),
                        ],
                      ),
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
