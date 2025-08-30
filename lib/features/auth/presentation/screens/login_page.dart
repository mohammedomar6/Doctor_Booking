import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/constant/my_images.dart';
import 'package:doctor_booking1/constant/my_strings.dart';
import 'package:doctor_booking1/core/app_validator.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/core/token_manger.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:doctor_booking1/features/home/presentation/screens/home_page.dart';
import 'package:doctor_booking1/features/pataint/presentation/manager/patiant_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

import '../../../home/presentation/screens/first_page.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
   bool  isLogin  = false ;
  final emailNode = FocusNode();

  final passNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state)async {
        if (state.statusLogin == Status.failed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('email or password incorrect '),
                backgroundColor: Colors.red,

              ),
            );
        }
        if (state.statusLogin == Status.success  && isLogin) {
        await  TokenManager1.saveToken(state.token!);
        context.read<PatiantBloc>().add(GetProfilePataintEvent());
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text('You have been logged in successfully'),
                backgroundColor: Colors.green,

              ),
            );

          context.pushAndRemoveUntilTransition(
            predicate:     (Route<dynamic> route) => false,
            type: PageTransitionType.topToBottom,
            child: FirstPage(),
            duration: Duration(seconds: 2
            ),

          );
        }
      },
      builder: (context, state) {
        return Scaffold(

          body: Padding(
            padding: EdgeInsets.all(context.screenHeight * 0.03),
            child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(

                      MyImages.signUpImage,
                      width: context.screenWidth * 0.7,
                    ),
                    Text(
                      MyStrings.signIn,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: MyColours.blue,
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.03),
                    Text(
                      MyStrings.textUnderSignIn,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.03),
                    // Email Field
                    CustomTextField(
                        icon: Icons.email,
                        focusNode: emailNode,
                        onSubmitted: (val) =>
                            FocusScope.of(context).requestFocus(passNode),
                        isEmailField: true,
                        label: MyStrings.labelEmail,
                        hint: MyStrings.hintEmail,
                        controller: emailController,
                        validator: (value) => AppValidator.email(value)),
                    SizedBox(
                      height: context.screenHeight * 0.02,
                    ),
                    CustomTextField(
                        focusNode: passNode,
                        icon: Icons.lock,
                        isPasswordField: true,
                        label: MyStrings.labelPassword,
                        hint: MyStrings.hintPassword,
                      controller: passwordController,
                       validator: (value) => AppValidator.required(value)
                      // ),
                    ),
                    SizedBox(height: context.screenHeight * 0.01),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          isLogin ==false;
                          context.pushNamedTransition(routeName:'/forgotpassword',type: PageTransitionType.sharedAxisHorizontal,duration: Duration(seconds: 2));
                        },
                        child: Text(
                          '${MyStrings.forgotPassword}?',
                          style: TextStyle(
                            color: MyColours.blue,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: context.screenWidth * 0.02),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: state.statusLogin == Status.loading
                            ? null
                            : () {
                                setState(() {
                                  if (_formKey.currentState!.validate()) {
                                    debugPrint(emailController.text);
                                    debugPrint(passwordController.text)
                                    ;
                                    isLogin=true;
                                    context.read<AuthBloc>().add(
                                          LoginEvent(
                                            email: emailController.text,
                                            password: passwordController.text,
                                          ),
                                        );
                                  }
                                });
                              },
                        child: state.statusLogin == Status.loading
                            ? SpinKitThreeBounce(
                                color: Colors.white,
                                size: 20,
                              )
                            : Text(
                                MyStrings.signIn,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                ),
                              ),
                      ),
                    ),
                    SizedBox(height: context.screenHeight * 0.02),

                    // Sign Up Link
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(MyStrings.dontHaveAccount),
                        TextButton(
                          onPressed: () {
                            context.pushNamedTransition(routeName:  '/signup',type: PageTransitionType.topToBottom,duration: Duration(seconds: 2));
                          },
                          child: Text(
                            MyStrings.signUp,
                            style: TextStyle(
                              color: MyColours.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
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
