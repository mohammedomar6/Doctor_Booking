import 'package:doctor_booking1/constant/theme.dart';
import 'package:doctor_booking1/features/auth/data/datasource/remote_data_source.dart';
import 'package:doctor_booking1/features/auth/data/repository/auth_repo.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/auth/presentation/screens/forget_password.dart';
import 'package:doctor_booking1/features/auth/presentation/screens/login_page.dart';
import 'package:doctor_booking1/features/auth/presentation/screens/send_email_Page.dart';
import 'package:doctor_booking1/features/auth/presentation/screens/sign_up_page.dart';
import 'package:doctor_booking1/features/home/presentation/bloc/home_bloc.dart';
import 'package:doctor_booking1/features/splash_intro/screen/intro_page.dart';
import 'package:doctor_booking1/features/splash_intro/screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home/presentation/screens/first_page.dart' show FirstPage;

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      child: MultiBlocProvider(
        providers: [
          
          BlocProvider(
            create: (context) => AuthBloc(
              authRepositories: AuthRepo(
                loginDataSource: LoginData(),
                forgotPasswordData: ForgotPasswordData(),
                signUpDataSource: SignUpData(),
              ),
            ),
          ),
          BlocProvider(
            create: (context) => HomeBloc()
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: MyTheme.themeData,
          routes: {
            '/': (context) => SplashPage(),
            '/onbording': (context) => IntroPage(),
            '/login': (context) => LoginPage(),
            '/signup': (context) => SignUpPage(),
            '/forgotpassword': (context) => SendEmailPage(),
            '/resetpassword': (context) => ForgetPassword(),
            '/home': (context) => FirstPage(),
          },
        ),
      ),
    );
  }
}
