import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_images.dart';
import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/core/app_validator.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final  nameNode =FocusNode();
  final  emailNode =FocusNode();
  final  passNode =FocusNode();
  final _formKey = GlobalKey<FormState>();
  bool isAgree = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status == Status.failed) {
          ScaffoldMessenger.of(context) ..hideCurrentSnackBar()..showSnackBar(

            SnackBar(
              content: Text('Sign up Failed'),
              backgroundColor: Colors.red,
            ),
          );
        }
        if (state.status == Status.success) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            '/home', // اسم الصفحة التي تريد الذهاب إليها
                (Route<dynamic> route) => false, // هذا يحذف كل الصفحات السابقة
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Padding(
            padding:  EdgeInsets.all(context.screenHeight*0.03),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Image.asset(MyImages.loginImage,width: context.screenWidth*0.6,),
                     Text(
                      MyStrings.createAccount,
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.w500),
                    ),

                    SizedBox(height: context.screenHeight * 0.03),
                    CustomTextField(
                      icon: Icons.person,
                      onSubmitted: (val) => FocusScope.of(context).requestFocus(emailNode),
                      label: MyStrings.labelName,
                      hint: MyStrings.hintName,
                      controller: nameController,
                      validator: (value) => AppValidator.required(value),
                    ),
                    SizedBox(height: context.screenHeight * 0.03),
                    CustomTextField(
                      icon: Icons.email,
                      onSubmitted: (val) => FocusScope.of(context).requestFocus(passNode) ,
                      isEmailField: true,
                      label: MyStrings.labelEmail,
                      hint: MyStrings.hintEmail,
                      controller: emailController,
                      validator: (value) => AppValidator.email(value),
                    ),
                    SizedBox(height: context.screenHeight * 0.03),
                    CustomTextField(
                      icon: Icons.lock,
                      isPasswordField: true,
                      label: MyStrings.labelPassword,
                      hint: MyStrings.hintPassword,
                      controller: passwordController,
                      validator: (value) => AppValidator.password(value)
                    ),
                    SizedBox(height: context.screenHeight * 0.01),
                    Row(
                      children: [
                        Checkbox(
                          value: isAgree,
                          onChanged: (value) =>
                              setState(() => isAgree = value!,),
                        ),
                         Text(MyStrings.agreeTerms,),
                      ],
                    ),
                    SizedBox(height: context.screenHeight * 0.015),
                    SizedBox(
                      width: context.screenWidth*0.7,
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
                        child: state.status == Status.loading
                            ? const SpinKitThreeBounce(
                                color: Colors.white,
                                size: 20,
                              )
                            :  Text(
                                MyStrings.signUp,
                                style: TextStyle(
                                    color: Colors.white, fontSize: 18),
                              ),
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(MyStrings.alreadyHaveAnAccount),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Text(
                            MyStrings.signIn,
                            style: TextStyle(
                              fontSize: 16,
                              decorationColor: MyColours.blue,
                              decoration: TextDecoration.underline,
                              color: MyColours.blue,
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
