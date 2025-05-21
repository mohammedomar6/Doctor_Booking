import 'package:doctor_booking1/core/responsive.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  CustomElevatedButton(
      {super.key,
      required this.onPressed,
      required this.text,
      required this.width});

  final void Function()? onPressed;

  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.screenWidth * width,
        child: ElevatedButton(

          onPressed: onPressed,
          child: Text(text),
        ));
  }
}
