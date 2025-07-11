import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_images.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/home/presentation/bloc/home_bloc.dart';
import 'package:doctor_booking1/features/home/presentation/screens/all_doc_page.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/custom_text_field.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/doctor_card.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/section_header.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/specialty_item.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/upcoming_appointment_card.dart';
import 'package:doctor_booking1/helper/get_icon_for_department.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final bloc = context.read<HomeBloc>();
    bloc.add(GetAllDocEvent());
    bloc.add(GetAllDepartmentsEvent());
  }

  @override
  Widget build(BuildContext context) {
    final width = context.screenWidth;
    final height = context.screenHeight;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Find Your Doctor",
          style: TextStyle(
            color: MyColours.black,
            fontSize: width * 0.05,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Colors.black,
              size: width * 0.065,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2,
              borderRadius: BorderRadius.circular(15),
              child: CustomTextFieldH(
                controller: searchController,
                hint: 'Search doctor, speciality...',
                iconPre: Icons.search,
                iconSuff: Icons.tune,
                fillColor: Colors.white,
                borderRadius: 15,
              ),
            ),
            SizedBox(height: height * 0.02),
            SectionHeader(title: "Upcoming Appointments", onTap: () {}),
            SizedBox(height: height * 0.012),
            UpcomingAppointmentCard(
              doctorName: "Dr. Jane Cooper",
              imagePath: MyImages.doc2,
              date: "Monday, 26 July",
              time: "09:00 - 10:00",
              type: "Dentist Consultation",
            ),
            SizedBox(height: height * 0.035),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Specialties',
                  style: TextStyle(
                    color: MyColours.black,
                    fontWeight: FontWeight.bold,
                    fontSize: context.screenWidth * 0.040,
                  ),
                ),
              ],
            ),
            SizedBox(height: height * 0.015),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.depStatus == Status.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.depStatus == Status.failed) {
                  return const Center(
                      child: Text("Failed to load departments"));
                } else if (state.depStatus == Status.success) {
                  return SizedBox(
                    height: height * 0.12,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemCount: state.departmentList.length,
                      separatorBuilder: (_, __) =>
                          SizedBox(width: width * 0.04),
                      itemBuilder: (_, index) {
                        final dep = state.departmentList[index];
                        return SpecialtyItem(
                          icon: getIconForDepartment(dep.name),
                          label: dep.name,
                        );
                      },
                    ),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),

            SizedBox(height: height * 0.035),
            SectionHeader(
              title: "Top Doctors",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: context.read<HomeBloc>(),
                      child: const AllDoctorsPage(),
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: height * 0.015),

            /// الأطباء
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state.docStatus == Status.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state.docStatus == Status.failed) {
                  return const Center(child: Text("Failed to load doctors"));
                } else if (state.docStatus == Status.success) {
                  final list = state.doctorModelList;
                  final top3 = list.length > 3 ? list.sublist(0, 3) : list;
                  return Column(
                    children: top3.map((doc) {
                      return Padding(
                        padding: EdgeInsets.only(
                            bottom: context.screenHeight * 0.02),
                        child: DoctorCard(
                          name: "Dr. ${doc.firstName} ${doc.lastName}",
                          specialty: doc.departmentName,
                          image: MyImages.doc2,
                          doctorId: doc.id,
                        ),
                      );
                    }).toList(),
                  );
                } else {
                  return const SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
