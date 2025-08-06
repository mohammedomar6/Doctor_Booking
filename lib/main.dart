import 'package:doctor_booking1/constant/theme.dart';
import 'package:doctor_booking1/features/auth/data/datasource/remote_data_source.dart';
import 'package:doctor_booking1/features/auth/data/repository/auth_repo.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/auth/presentation/screens/forget_password.dart';
import 'package:doctor_booking1/features/auth/presentation/screens/login_page.dart';
import 'package:doctor_booking1/features/auth/presentation/screens/send_email_Page.dart';
import 'package:doctor_booking1/features/auth/presentation/screens/sign_up_page.dart';
import 'package:doctor_booking1/features/booking/presentation/blocs/available_booking/available_booking_bloc.dart';
import 'package:doctor_booking1/features/company/data/data_sources/remote_data_source_company.dart';
import 'package:doctor_booking1/features/company/data/repositories/company_repo.dart';
import 'package:doctor_booking1/features/company/presentation/manager/company_bloc.dart';
import 'package:doctor_booking1/features/medical_history/data/data_sources/medical_history_data_source.dart';
import 'package:doctor_booking1/features/medical_history/data/repositories/medical_history_repo.dart';
import 'package:doctor_booking1/features/medical_history/presentation/manager/medical_history_bloc.dart';
import 'package:doctor_booking1/features/medical_history/presentation/pages/medical_history_page.dart';
import 'package:doctor_booking1/features/pataint/data/data_sources/pataint_remote_data_source.dart';
import 'package:doctor_booking1/features/pataint/data/repositories/pataint_repo.dart';
import 'package:doctor_booking1/features/pataint/presentation/manager/patiant_bloc.dart';
import 'package:doctor_booking1/features/splash_intro/screen/intro_page.dart';
import 'package:doctor_booking1/features/splash_intro/screen/splash_page.dart';
import 'package:doctor_booking1/features/wallet/data/data_sources/remote_data_source_wallet.dart';
import 'package:doctor_booking1/features/wallet/data/repositories/wallet_repo.dart';
import 'package:doctor_booking1/features/wallet/presentation/manager/wallet_bloc.dart';
import 'package:doctor_booking1/features/wallet/presentation/pages/wallet_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'features/home/presentation/bloc/home_bloc.dart';
import 'features/home/presentation/screens/first_page.dart' show FirstPage;
import 'features/pataint/presentation/pages/create_pataint_screen.dart';
import 'features/pataint/presentation/pages/profile_pataint_screen.dart';

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
          BlocProvider(create: (context) => HomeBloc()),
          BlocProvider(
              create: (context) => MedicalHistoryBloc(
                  medicalHistoryRepo: MedicalHistoryRepo(
                      medicalHistoryData: MedicalHistoryData()))),
          BlocProvider(
            create: (context) => PatiantBloc(
                pataintRepo: PataintRepo(
                    pataintRemoteDataSource: PataintRemoteDataSource())),
          ),
          BlocProvider(
            create: (context) => WalletBloc(
                walletRepo: WalletRepo(
                    remoteDataSourceWallet: RemoteDataSourceWallet())),
          ),
          BlocProvider(
            create: (context) => CompanyBloc(CompanyRepo(remoteDataSourceCompany: RemoteDataSourceCompany())),
          ),
          BlocProvider(
            create: (context) => AvailableBookingBloc(),
          )
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
            '/medical': (context) => MedicalHistoryScreen(),
            '/create_pataint': (context) => CreatePatientScreen(),
            '/patient_profile_screen': (context) => PatientProfileScreen(),
            '/wallet_screen': (context) => WalletScreen()
          },
        ),
      ),
    );
  }
}
