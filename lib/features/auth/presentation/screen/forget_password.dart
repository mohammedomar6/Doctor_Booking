import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/features/auth/presentation/screen/verify_number_page.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';


class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final passwordEditor = TextEditingController();
  final newPasswordEditor = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                'New Password',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Column(
                children: [
                  Text(
                    "your new password must be different",
                    style: TextStyle(
                      fontFamily: '',
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    "from previously used password",
                    style: TextStyle(
                      fontFamily: '',
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 48,
              ),
              CustomTextField(
                hint: '************',
                label: 'password',
                isPasswordField: true,
                controller: passwordEditor,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                hint: '************',
                label: 'confirm password',
                isPasswordField: true,
                controller: newPasswordEditor,
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VerifyNumberPage(),
                      ),
                    );
                  },
                  style: ButtonStyle(
                    elevation: WidgetStatePropertyAll(4),
                    shadowColor: WidgetStatePropertyAll(Colors.black26),
                    backgroundColor: WidgetStatePropertyAll(kColor),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: 32,
                      ),
                    ),
                  ),
                  child: Text(
                    'Create New Password',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
