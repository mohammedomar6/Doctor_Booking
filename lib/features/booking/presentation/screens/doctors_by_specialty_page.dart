import 'package:doctor_booking1/constant/my_images.dart';
import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/home/presentation/widgets/doctor_card.dart';
import 'package:flutter/material.dart';

class DoctorsBySpecialtyPage extends StatelessWidget {
  final String specialty;

  const DoctorsBySpecialtyPage({super.key, required this.specialty});

  static final List<Map<String, String>> allDoctors = [
    {
      "name": "Dr. Lina lina",
      "specialty": MyStrings.dentist,
      "image": MyImages.doc1,
    },
    {
      "name": "Dr.Abd alghani soud",
      "specialty": MyStrings.cardiologist,
      "image": MyImages.doc2,
    },
    {
      "name": "Dr.Soso alwahesh",
      "specialty": MyStrings.neurologist,
      "image": MyImages.doc3,
    },
    {
      "name": "Dr.Mohammad Mansour",
      "specialty": MyStrings.cardiologist,
      "image": MyImages.doc4,
    },
    {
      "name": "Dr.Roaa Salam",
      "specialty": MyStrings.childSpecialist,
      "image": MyImages.doc1,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final doctors =
        allDoctors.where((doc) => doc['specialty'] == specialty).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          specialty,
          style: const TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.04),
        child: ListView.builder(
          itemCount: doctors.length,
          itemBuilder: (context, index) {
            final doctor = doctors[index];
            return DoctorCard(
              name: doctor['name']!,
              specialty: doctor['specialty']!,
              image: doctor['image']!,
            );
          },
        ),
      ),
    );
  }
}
