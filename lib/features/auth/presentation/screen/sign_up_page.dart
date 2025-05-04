import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/icon_sign_in_with.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/images_sign_in_with.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final nameController = TextEditingController();

  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 32,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 115,
              ),
              Text(
                'Create Account',
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
                    "Fill your information below or register",
                    style: TextStyle(
                      fontFamily: '',
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    " with your social account",
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
                label: 'Name',
                hint: 'Ahmad Mohsen',
                controller: emailController,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                isEmailField: true,
                label: 'email',
                hint: 'Example@gmail.com',
                controller: emailController,
              ),
              const SizedBox(
                height: 24,
              ),
              CustomTextField(
                isPasswordField: true,
                label: 'password',
                hint: '************',
                controller: passwordController,
              ),
              const SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: isAgree,
                    onChanged: (data) {
                      setState(() {
                        isAgree = !isAgree;
                      });
                    },
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Agree with Terms & Condition',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: '',
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.80,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    elevation: WidgetStatePropertyAll(4),
                    shadowColor: WidgetStatePropertyAll(Colors.black26),
                    backgroundColor: WidgetStatePropertyAll(kColor),
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 32,
                      ),
                    ),
                  ),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      indent: 40,
                      endIndent: 10,
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      "Or sign up with",
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      indent: 10,
                      endIndent: 40,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconSignInWith(
                    icon: FontAwesomeIcons.apple,
                    color: Colors.black,
                    onTap: () {},
                  ),
                  const SizedBox(width: 20),
                  ImagesSignInWith(
                    onTap: () {},
                    imageName: 'assets/icons/go.png',
                  ),
                  const SizedBox(width: 20),
                  IconSignInWith(
                    icon: FontAwesomeIcons.facebookF,
                    color: Colors.blue,
                    onTap: () {},
                  ),
                ],
              ),
              const SizedBox(
                height: 24,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account ? ",
                    style: TextStyle(
                      fontFamily: '',
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: '',
                        decorationColor: kColor,
                        decoration: TextDecoration.underline,
                        color: kColor,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
