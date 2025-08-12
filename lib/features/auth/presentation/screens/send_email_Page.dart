import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_images.dart';
import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/core/app_validator.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/core/token_manger.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/auth/presentation/screens/forget_password.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_elevatedbutton.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, ReadContext;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

class SendEmailPage extends StatelessWidget {
  SendEmailPage({super.key});

  final emailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.statusSendEmail == Status.success ) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(' Send Email Successfully '),
                backgroundColor: Colors.green,
              ),
            );
          context.pushReplacementTransition(
              child: ForgetPassword(),
              type: PageTransitionType.leftToRight,
              duration: Duration(seconds: 2));
        }
        if (state.statusSendEmail == Status.failed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
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
                    Image.asset(
                      MyImages.forgotPassword,
                      height: context.screenHeight * 0.4,
                    ),
                    Text(
                      MyStrings.forgotPassword,
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
                      height: context.screenHeight * 0.05,
                    ),
                    CustomElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            context.read<AuthBloc>().add(
                                  ForgotPasswordEvent(
                                    email: emailController.text,
                                  ),
                                );
                          }
                        },
                        child: state.statusSendEmail == Status.loading
                            ?
                            SpinKitDoubleBounce(color: MyColours.white,size: 12,): Text(MyStrings.sendEmail),
                        width: 0.6)
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
