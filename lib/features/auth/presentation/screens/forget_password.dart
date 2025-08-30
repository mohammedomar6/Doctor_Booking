import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/core/app_validator.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/auth/presentation/screens/login_page.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show BlocConsumer, ReadContext;
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

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
      listener: (context, state) {
        if (state.statusResetPass == Status.success) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Reset Password Sussecfully',),backgroundColor: Colors.green,));
                context.pushAndRemoveUntilTransition(
                    predicate:     (Route<dynamic> route) => false,
        type: PageTransitionType.topToBottom,
        child: LoginPage(),
        duration: Duration(seconds: 2
        ),
                );
        }
        if (state.statusResetPass == Status.failed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(' Reset Password Faild'),
                backgroundColor: MyColours.red,
              ),
            );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: true,
            elevation: 0,
          ),
          body: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(MyImages.resetPassword,height: context.screenHeight*0.36,),
                    Text(
                      MyStrings.newPassword,
                      style: TextStyle(
                        fontSize: context.screenHeight*0.042,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                     SizedBox(
                      height: context.screenHeight*0.002,
                    ),
                    Column(
                      children: [
                        Text(
                         MyStrings.underNewPassword1,
                          style: TextStyle(

                            color: MyColours.grey,
                          ),
                        ),
                        Text(
                         MyStrings.underNewPassword2,
                          style: TextStyle(

                            color: MyColours.grey,
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                       height: context.screenHeight*0.02,
                    ),
                    CustomTextField(

                      validator: (value) => AppValidator.required(value),
                      icon: Icons.lock,
                      focusNode: pass1Node,
                      onSubmitted: (val) {
                        FocusScope.of(context).requestFocus(pass2Node);
                      },
                      hint: MyStrings.hintPassword,
                      label: MyStrings.labelPassword,
                      isPasswordField: true,
                      controller: passwordEditor,
                    ),
                    SizedBox(
                      height: context.screenHeight*0.02,
                    ),
                    CustomTextField(
                      focusNode: pass2Node,
                      validator: (value) => AppValidator.required(value),
                      icon: Icons.lock,
                      hint: MyStrings.hintPassword,
                      label: MyStrings.confirmPassword,
                      isPasswordField: true,
                      controller: newPasswordEditor,
                    ),
                    SizedBox(
                      height: context.screenHeight*0.04,
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

                          }
                        },
                        child:state.statusResetPass==Status.loading?SpinKitDoubleBounce(color: MyColours.white,size: 12,) :Text(
                         MyStrings.createNewPassword,
                          style: TextStyle(
                            color: MyColours.white,
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
