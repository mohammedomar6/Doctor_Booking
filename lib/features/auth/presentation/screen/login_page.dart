import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/features/auth/presentation/screen/forget_password.dart';
import 'package:doctor_booking1/features/auth/presentation/screen/sign_up_page.dart';
import 'package:doctor_booking1/features/auth/presentation/screen/verify_number_page.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/icon_sign_in_with.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/images_sign_with.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
                height: 145,
              ),
              Text(
                'Sign In',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Hi Welcome back , you've been missed",
                style: TextStyle(
                  fontFamily: '',
                  color: Colors.grey,
                ),
              ),
              const SizedBox(
                height: 48,
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
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgetPassword(),
                        ),
                      );
                    },
                    child: Text(
                      'Forget password?',
                      style: TextStyle(
                        decorationColor: kColor,
                        fontSize: 16,
                        fontFamily: '',
                        decoration: TextDecoration.underline,
                        color: kColor,
                      ),
                    ),
                  ),
                ],
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
                      "Or sign in with",
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
                    imageName: 'assets/images/go.png',
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
                    "Don't have an account ? ",
                    style: TextStyle(
                      fontFamily: '',
                      fontSize: 16,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignUpPage(),
                        ),
                      );
                    },
                    child: Text(
                      'Sign Up',
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
