import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SpecialtyItem extends StatelessWidget {
  final IconData icon;
  final String label;

  const SpecialtyItem({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: context.screenWidth * 0.08,
          backgroundColor: Colors.blue.shade100,
          child: FaIcon(
            icon,
            color: MyColours.blue,
            size: context.screenWidth * 0.06,
          ),
        ),
        SizedBox(
          height: context.screenHeight * 0.008,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: context.screenWidth * 0.03,
          ),
        ),
      ],
    );
  }
}
