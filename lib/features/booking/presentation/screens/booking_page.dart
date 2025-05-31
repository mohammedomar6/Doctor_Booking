import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/booking/presentation/screens/doctors_by_specialty_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BookingPage extends StatelessWidget {
  BookingPage({super.key});

  final List<Map<String, dynamic>> specialties = [
    {"label": MyStrings.dentist, "icon": FontAwesomeIcons.tooth},
    {"label": MyStrings.cardiologist, "icon": FontAwesomeIcons.heartPulse},
    {"label": MyStrings.orthopedic, "icon": FontAwesomeIcons.bone},
    {"label": MyStrings.neurologist, "icon": FontAwesomeIcons.brain},
    {"label": MyStrings.dermatology, "icon": FontAwesomeIcons.handsBubbles},
    {"label": 'Orthopedics', "icon": FontAwesomeIcons.bone},
    {"label": MyStrings.childSpecialist, "icon": FontAwesomeIcons.baby},
    {"label": MyStrings.generalPhysician, "icon": FontAwesomeIcons.userDoctor},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          MyStrings.chooseSpecialty,
          style: TextStyle(
            color: MyColours.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: MyColours.white,
        elevation: 0,
        iconTheme:  IconThemeData(color: MyColours.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.04),
        child: GridView.builder(
          itemCount: specialties.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: context.screenWidth * 0.04,
            mainAxisSpacing: context.screenWidth * 0.02,
            childAspectRatio: 1,
          ),
          itemBuilder: (context, index) {
            final item = specialties[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        DoctorsBySpecialtyPage(specialty: item["label"]),
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
                        item["icon"],
                        color: MyColours.blue,
                        size: context.screenWidth * 0.08,
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.015),
                    Text(
                      item["label"],
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
        ),
      ),
    );
  }
}
