import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomOTPField extends StatefulWidget {
  final int length;
  final ValueChanged<String>? onCompleted;
  final List<TextEditingController>? controllers;
  final List<FocusNode>? focusNodes;
  final InputDecoration decoration;
  final TextStyle? style;
  final TextInputType keyboardType;

  const CustomOTPField({
    super.key,
    this.length = 4,
    this.onCompleted,
    this.controllers,
    this.focusNodes,
    this.decoration = const InputDecoration(),
    this.style,
    this.keyboardType = TextInputType.number,
  });

  @override
  State<CustomOTPField> createState() => _CustomOTPFieldState();
}

class _CustomOTPFieldState extends State<CustomOTPField> {
  late List<TextEditingController> _controllers;
  late List<FocusNode> _focusNodes;

  @override
  void initState() {
    super.initState();
    _controllers = widget.controllers ??
        List.generate(widget.length, (index) => TextEditingController());
    _focusNodes = widget.focusNodes ??
        List.generate(widget.length, (index) => FocusNode());
  }

  @override
  void dispose() {
    if (widget.controllers == null) {
      for (var controller in _controllers) {
        controller.dispose();
      }
    }
    if (widget.focusNodes == null) {
      for (var node in _focusNodes) {
        node.dispose();
      }
    }
    super.dispose();
  }

  void _onChanged(String value, int index) {
    if (value.length == 1 && index < widget.length - 1) {
      FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
    } else if (value.isEmpty && index > 0) {
      FocusScope.of(context).requestFocus(_focusNodes[index - 1]);
    }

    if (_isAllFilled() && widget.onCompleted != null) {
      widget.onCompleted!(_getOtp());
    }
  }

  bool _isAllFilled() {
    for (var controller in _controllers) {
      if (controller.text.isEmpty) return false;
    }
    return true;
  }

  String _getOtp() {
    return _controllers.map((c) => c.text).join();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        widget.length,
            (index) => SizedBox(
          width: 60,
          child: TextField(
            controller: _controllers[index],
            focusNode: _focusNodes[index],
            textAlign: TextAlign.center,
            keyboardType: widget.keyboardType,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(1),
            ],
            style: widget.style ?? const TextStyle(fontSize: 24),
            decoration: widget.decoration.copyWith(
              counterText: '',
              enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.grey),
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.blue),
                borderRadius: BorderRadius.circular(12),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onChanged: (value) => _onChanged(value, index),
            onTap: () => _controllers[index].selection = TextSelection.fromPosition(
              TextPosition(offset: _controllers[index].text.length),
            ),
          ),
        ),
      ),
    );
  }
}