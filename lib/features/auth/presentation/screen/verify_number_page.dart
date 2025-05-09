import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_otp_field.dart';
import 'package:flutter/material.dart';


class VerifyNumberPage extends StatefulWidget {
  const VerifyNumberPage({super.key});

  @override
  State<VerifyNumberPage> createState() => _VerifyNumberPageState();
}

class _VerifyNumberPageState extends State<VerifyNumberPage> {
  final List<TextEditingController> _otpControllers = List.generate(
    4,
    (index) => TextEditingController(),
  );
  final List<FocusNode> _otpFocusNodes =
      List.generate(4, (index) => FocusNode());

  @override
  void initState() {
    super.initState();
    for (var node in _otpFocusNodes) {
      node.addListener(() {});
    }
  }

  @override
  void dispose() {
    for (var controller in _otpControllers) {
      controller.dispose();
    }
    for (var node in _otpFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Verify Code',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 8),
              Column(
                children: [
                  Text(
                    "Please enter the code we sent to email",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "example@gmail.com",
                    style: TextStyle(
                      color: MyColours.blue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              CustomOTPField(
                keyboardType: TextInputType.number,
                length: 4,
                controllers: _otpControllers,
                focusNodes: _otpFocusNodes,
                onCompleted: (otp) {
                  debugPrint("OTP entered: $otp");
                },
              ),
              const SizedBox(height: 16),
              Text(
                "Didn't receive OTP?",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 8),
              GestureDetector(
                onTap: () {},
                child: Text(
                  "Resend code",
                  style: TextStyle(
                    fontSize: 16,
                    decoration: TextDecoration.underline,
                    color: MyColours.blue,
                  ),
                ),
              ),
              const SizedBox(height: 24),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    elevation: const WidgetStatePropertyAll(4),
                    shadowColor: const WidgetStatePropertyAll(Colors.black26),
                    backgroundColor: WidgetStatePropertyAll(MyColours.blue),
                    padding: const WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 12, horizontal: 32),
                    ),
                  ),
                  child: const Text(
                    'Verify',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
