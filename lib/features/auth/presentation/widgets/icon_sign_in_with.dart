import 'package:flutter/material.dart';

class IconSignInWith extends StatefulWidget {
  IconSignInWith({
    required this.icon,
    required this.onTap,
    required this.color,
    super.key,
  });

  void Function()? onTap;
  IconData icon;
  Color color;

  @override
  State<IconSignInWith> createState() => _IconSignInWithState();
}

class _IconSignInWithState extends State<IconSignInWith> {
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
        child: Icon(
          widget.icon,
          color: widget.color,
          size: 30,
        ),
      ),
    );
  }
}
