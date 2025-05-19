import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:flutter/material.dart';

class CustomTextFieldH extends StatefulWidget {
  const CustomTextFieldH({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.label,
    this.hint,
    this.fillColor,
    this.iconSuff,
    this.iconPre,
    this.borderRadius = 20.0,
  });

  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function(String?)? onSubmitted;
  final String? label;
  final String? hint;
  final Color? fillColor;
  final IconData? iconSuff;
  final IconData? iconPre;
  final double borderRadius;

  @override
  State<CustomTextFieldH> createState() => _CustomTextFieldHState();
}

class _CustomTextFieldHState extends State<CustomTextFieldH> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.never,
        label: widget.label == null ? null : Text(widget.label!),
        hintText: widget.hint ?? '',
        hintStyle: TextStyle(
          color: Colors.grey[500],
          fontSize: 16,
        ),
        filled: true,
        fillColor: widget.fillColor ?? Colors.grey[100],
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        prefixIcon: widget.iconPre == null
            ? null
            : Icon(
                widget.iconPre,
                size: 22,
                color: MyColours.grey,
              ),
        suffixIcon: widget.iconSuff == null
            ? null
            : Icon(
                widget.iconSuff,
                size: 22,
                color: MyColours.grey,
              ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius,
          ),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(
            widget.borderRadius,
          ),
          borderSide: BorderSide(
            color: MyColours.grey,
            width: 1.2,
          ),
        ),
      ),
    );
  }
}
