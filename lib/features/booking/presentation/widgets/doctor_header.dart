import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:flutter/material.dart';

class DoctorHeader extends StatelessWidget {
  final String? imagePath; // 👈 صارت nullable من الباك اند
  final String doctorName;
  final String specialty;
  final int price;

  const DoctorHeader({
    super.key,
    required this.price,
    required this.imagePath,
    required this.doctorName,
    required this.specialty,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(context.screenWidth * 0.04),
          child: SizedBox(
            width: context.screenWidth * 0.4,
            height: context.screenWidth * 0.4,
            child: buildDoctorImage(),
          ),
        ),
        SizedBox(height: context.screenHeight * 0.03),
        Text(
          doctorName,
          style: TextStyle(
            fontSize: context.screenWidth * 0.05,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: context.screenHeight * 0.02),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              specialty,
              style: TextStyle(
                fontSize: context.screenWidth * 0.04,
                color: Colors.grey[700],
              ),
            ),
            Text(
              "$price SYP",
              style: TextStyle(
                fontSize: context.screenWidth * 0.04,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
        SizedBox(height: context.screenHeight * 0.04),
      ],
    );
  }

  Widget buildDoctorImage() {
    if (imagePath != null && imagePath!.isNotEmpty) {
      return Image.network(
        imagePath!,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, progress) {
          if (progress == null) return child;
          return const Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );
        },
        errorBuilder: (context, o, w) => Icon(
          Icons.person,
          color: MyColours.blue,
          size: 100,
        ),
      );
    } else {
      return Icon(
        Icons.person,
        color: MyColours.blue,
        size: 40,
      );
    }
  }
}
