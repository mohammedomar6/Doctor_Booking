import 'package:doctor_booking1/constant/theme.dart';
import 'package:doctor_booking1/features/auth/data/datasource/remote_data_source.dart';
import 'package:doctor_booking1/features/auth/data/repository/auth_repo.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/splash_intro/screen/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc(
            authRepositories: AuthRepo(
              loginDataSource: LoginData(),
              signUpDataSource: SignUpData(),
            ),
          ),
        ),
      ],
      child: MaterialApp(

        debugShowCheckedModeBanner: false,
        theme:MyTheme.themeData,
        home: SplashPage(),
      ),
    );
  }
}