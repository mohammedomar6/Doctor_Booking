import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:flutter/material.dart';



class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {


    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: context.screenWidth * 0.045,
          ),
        ),
        GestureDetector(
          onTap: onTap,
          child: Text(
            'See All',
            style: TextStyle(
              color: MyColours.blue,
              fontSize: context.screenWidth * 0.032,
            ),
          ),
        ),
      ],
    );
  }
}
