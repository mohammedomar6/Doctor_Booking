import 'package:flutter/material.dart';

class ImagesSignInWith extends StatefulWidget {
  ImagesSignInWith({
    required this.onTap,
    required this.imageName,
    super.key,
  });

  void Function()? onTap;
  final String imageName;

  @override
  State<ImagesSignInWith> createState() => _ImagesSignInWithState();
}

class _ImagesSignInWithState extends State<ImagesSignInWith> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            widget.imageName,
          ),
        ),
      ),
    );
  }
}
