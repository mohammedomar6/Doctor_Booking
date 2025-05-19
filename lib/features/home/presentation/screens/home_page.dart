import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_images.dart';
import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/custom_text_field.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/doctor_card.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/section_header.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/specialty_item.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/upcoming_appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  final List<Map<String, dynamic>> specialties = [
    {"label": MyStrings.dentist, "icon": FontAwesomeIcons.tooth},
    {"label": MyStrings.cardiologist, "icon": FontAwesomeIcons.heartPulse},
    {"label": MyStrings.orthopedic, "icon": FontAwesomeIcons.bone},
    {"label": MyStrings.neurologist, "icon": FontAwesomeIcons.brain},
    {"label": MyStrings.childSpecialist, "icon": FontAwesomeIcons.baby},
    {"label": MyStrings.generalPhysician, "icon": FontAwesomeIcons.userDoctor},
  ];

  final List<Map<String, String>> topDoctors = [
    {
      "name": "Dr. Jane Cooper",
      "specialty": MyStrings.dentist,
      "image": MyImages.doc3,
    },
    {
      "name": "Dr. Robert Fox",
      "specialty": MyStrings.cardiologist,
      "image": MyImages.doc2,
    },
    {
      "name": "Dr. Jacob Jones",
      "specialty": MyStrings.neurologist,
      "image": MyImages.doc4,
    },
  ];
  final searchController = TextEditingController();

  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Find Your Doctor",
          style: TextStyle(
            color: MyColours.black,
            fontSize: context.screenWidth * 0.05,
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
              size: context.screenWidth * 0.065,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(
          context.screenWidth * 0.04,
        ),
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
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            SectionHeader(
              title: "Upcoming Appointments",
              onTap: () {},
            ),
            SizedBox(
              height: context.screenHeight * 0.012,
            ),
            UpcomingAppointmentCard(
              doctorName: "Dr. Jane Cooper",
              imagePath: MyImages.doc2,
              date: "Monday, 26 July",
              time: "09:00 - 10:00",
              type: "Dentist Consultation",
            ),
            SizedBox(height: context.screenHeight * 0.035),
            SectionHeader(title: "Specialties", onTap: () {}),
            SizedBox(height: context.screenHeight * 0.015),
            SizedBox(
              height: context.screenHeight * 0.12,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: specialties.length,
                separatorBuilder: (context, __) => SizedBox(
                  width: context.screenWidth * 0.04,
                ),
                itemBuilder: (context, index) => SpecialtyItem(
                  icon: specialties[index]['icon'],
                  label: specialties[index]['label'],
                ),
              ),
            ),
            SizedBox(
              height: context.screenHeight * 0.035,
            ),
            SectionHeader(
              title: "Top Doctors",
              onTap: () {},
            ),
            SizedBox(
              height: context.screenHeight * 0.015,
            ),
            Column(
              children: topDoctors
                  .map(
                    (doc) => Padding(
                      padding: EdgeInsets.only(
                        bottom: context.screenHeight * 0.02,
                      ),
                      child: DoctorCard(
                        name: doc['name']!,
                        specialty: doc['specialty']!,
                        image: doc['image']!,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: MyColours.blue,
        unselectedItemColor: MyColours.grey,
        selectedFontSize: context.screenWidth * 0.035,
        unselectedFontSize: context.screenWidth * 0.032,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Bookings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
