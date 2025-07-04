import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    super.key,
    required this.controller,
    this.validator,
    this.focusNode,
    this.onChanged,
    this.onSubmitted,
    this.label,
    this.hint,
    this.fillColor,
    this.isPasswordField = false,
    this.isEmailField = false,
    this.icon,
    this.keybordtype
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
  final IconData? icon;
  final FocusNode? focusNode;
  final  TextInputType? keybordtype ;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey.shade200,
          border: Border(top: BorderSide(color: Colors.grey.shade300,)),
          borderRadius: BorderRadius.all(Radius.circular(12)),
          boxShadow: [

            BoxShadow(
                color: Colors.grey.shade400,
                offset: Offset(0, 8),
                blurRadius: 5,
                spreadRadius:0.5,
                blurStyle: BlurStyle.inner),
          ]),
      child: TextFormField(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        focusNode: widget.focusNode,
        controller: widget.controller,
        validator: widget.validator,
        onChanged: widget.onChanged,
        keyboardType: widget.keybordtype,
        onFieldSubmitted: widget.onSubmitted,
        obscureText: widget.isPasswordField ? _obscureText : false,
        obscuringCharacter: '*',
        decoration: InputDecoration(
            icon: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                widget.icon,

              ),
            ),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            label: widget.label == null ? null : Text(widget.label!),
            hintText: widget.hint,
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
                : null,
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            border: InputBorder.none),
      ),
    );
  }
}
