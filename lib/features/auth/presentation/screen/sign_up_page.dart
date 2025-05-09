import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/auth/presentation/screen/home_page.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/icon_sign_in_with.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/images_sign_in_with.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == Status.failed) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Sign up failed'),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state.status == Status.succses) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 115),
                    const Text(
                      'Create Account',
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 8),
                    const Text("Fill your information below or register",
                        style: TextStyle(color: Colors.grey),),
                    const Text("with your social account",
                        style: TextStyle(color: Colors.grey),),
                    const SizedBox(height: 48),
                    CustomTextField(
                      label: 'Name',
                      hint: 'Ahmad Mohsen',
                      controller: nameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 24,),
                    CustomTextField(
                      isEmailField: true,
                      label: 'Email',
                      hint: 'Example@gmail.com',
                      controller: emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$')
                            .hasMatch(value)) {
                          return 'Invalid email';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 24,),
                    CustomTextField(
                      isPasswordField: true,
                      label: 'Password',
                      hint: '************',
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        if (value.length < 8) {
                          return 'Password too short';
                        } else {
                          return null;
                        }
                      },
                    ),
                    const SizedBox(height: 8,),
                    Row(
                      children: [
                        Checkbox(
                          value: isAgree,
                          onChanged: (value) =>
                              setState(() => isAgree = value!,),
                        ),
                        const Text('Agree with Terms & Condition',),
                      ],
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.status == Status.loading
                            ? null
                            : () {
                                if (_formKey.currentState!.validate()) {
                                  if (!isAgree) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content:
                                            Text('You must agree to the terms'),
                                        backgroundColor: Colors.orange,
                                      ),
                                    );
                                    return;
                                  }
                                  context.read<AuthBloc>().add(
                                        SignUpEvent(
                                          name: nameController.text.trim(),
                                          email: emailController.text.trim(),
                                          password:
                                              passwordController.text.trim(),
                                        ),
                                      );
                                }
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kColor,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: state.status == Status.loading
                            ? const SpinKitThreeBounce(
                                color: Colors.white,
                                size: 20,
                              )
                            : const Text(
                                'Sign Up',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: const [
                        Expanded(
                            child: Divider(
                                indent: 40, endIndent: 10, color: Colors.grey)),
                        Text("Or sign up with",
                            style: TextStyle(color: Colors.grey)),
                        Expanded(
                            child: Divider(
                                indent: 10, endIndent: 40, color: Colors.grey)),
                      ],
                    ),
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account ? "),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 16,
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
          ),
        );
      },
    );
  }
}
