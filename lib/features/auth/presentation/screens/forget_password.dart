import 'package:doctor_booking1/core/app_validator.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, ReadContext;

import '../../../../constant/my_images.dart';

class ForgetPassword extends StatelessWidget {
  ForgetPassword({super.key});

  final passwordEditor = TextEditingController();
  final newPasswordEditor = TextEditingController();
  final FocusNode pass1Node = FocusNode();
  final FocusNode pass2Node = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24,
                vertical: 32,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(MyImages.resetPassword),
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
                      validator: (value) => AppValidator.password(value),
                      icon: Icons.lock,
                      focusNode: pass1Node,
                      onSubmitted: (val) {
                        FocusScope.of(context).requestFocus(pass2Node);
                      },
                      hint: '************',
                      label: 'password',
                      isPasswordField: true,
                      controller: passwordEditor,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    CustomTextField(
                      focusNode: pass2Node,
                      validator: (value) => AppValidator.password(value),
                      icon: Icons.lock,
                      hint: '************',
                      label: 'confirm password',
                      isPasswordField: true,
                      controller: newPasswordEditor,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SizedBox(
                      width: context.screenWidth * 0.80,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            if (passwordEditor.text != newPasswordEditor.text)
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content:
                                          Text('Password does not match ')));
                            else {
                              context.read<AuthBloc>().add(ResetPasswordEvent(
                                  password: passwordEditor.text));
                            }
                            if (state.status == Status.success) {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: Text('sucssesful reset password'),
                                    actions: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, '/login');
                                          },
                                          child: Text('yes')),
                                    ],
                                  );
                                },
                              );
                            }
                          }
                        },
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
          ),
        );
      },
    );
  }
}
