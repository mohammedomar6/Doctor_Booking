import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    this.onChanged,
    this.onSubmitted,
    this.label,
    this.hint,
    this.fillColor,
    this.isPasswordField = false,
    this.isEmailField = false,
  });

  final bool isEmailField;
  final bool isPasswordField;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final Function(String?)? onChanged;
  final Function(String?)? onSubmitted;
  final String? label;
  final String? hint;
  final Color? fillColor;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      onChanged: widget.onChanged,
      onFieldSubmitted: widget.onSubmitted,
      obscureText: widget.isPasswordField ? _obscureText : false,
      obscuringCharacter: '*',
      decoration: InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        label: widget.label == null ? null : Text(widget.label!),
        filled: true,
        hintText: widget.hint,
        fillColor: widget.fillColor,
        suffixIcon: widget.isPasswordField
            ? IconButton(
                icon: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                ),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : widget.isEmailField
                ? Icon(
                    Icons.email,
                  )
                : null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(),
        ),
      ),
    );
  }
}
