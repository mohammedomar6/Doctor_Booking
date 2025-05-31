import 'package:doctor_booking1/constant/my_images.dart';
import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/core/app_validator.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_elevatedbutton.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, ReadContext;

class SendEmailPage extends StatelessWidget {
  SendEmailPage({super.key});

  final emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          Navigator.pushReplacementNamed(context,'/resetpassword');
        }
        if(state.status==Status.failed) {
          ScaffoldMessenger.of(context) ..hideCurrentSnackBar()..showSnackBar(

            SnackBar(
              content: Text(' Email Not Found '),
              backgroundColor: Colors.red,
            ),
          );

        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Padding(
                padding: EdgeInsets.only(top: context.screenWidth * 0.1),
                child: Column(
                  children: [
                    Image.asset(MyImages.forgotPassword),
                    Text(
                      'Forgot Password',
                      style: TextStyle(fontSize: 25),
                    ),
                    Padding(
                      padding: EdgeInsets.all(context.screenHeight * 0.02),
                      child: CustomTextField(
                        controller: emailController,
                        hint: MyStrings.hintEmail,
                        label: MyStrings.labelEmail,
                        icon: Icons.email,
                        validator: (value) => AppValidator.email(value),
                      ),
                    ),
                    SizedBox(
                      height: context.screenHeight * 0.1,
                    ),
                    CustomElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate() ) {
                            context.read<AuthBloc>().add(
                                  ForgotPasswordEvent(
                                    email: emailController.text,
                                  ),
                                );

                          }

                        },
                        text: MyStrings.sendEmail,
                        width: 0.8)
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
