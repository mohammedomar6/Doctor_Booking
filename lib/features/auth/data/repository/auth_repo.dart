import 'dart:async';
import 'package:dartz/dartz.dart';
import 'package:doctor_booking1/features/auth/data/datasource/remote_data_source.dart';
import 'package:doctor_booking1/features/auth/data/models/forgot_password_request.dart';
import 'package:doctor_booking1/features/auth/data/models/forgot_password_response.dart';
import 'package:doctor_booking1/features/auth/data/models/login_request.dart';
import 'package:doctor_booking1/features/auth/data/models/login_response.dart';
import 'package:doctor_booking1/features/auth/data/models/reset_password_request.dart';
import 'package:doctor_booking1/features/auth/data/models/sign_up_request.dart';

class AuthRepo {
  final LoginData loginDataSource;
  final SignUpData signUpDataSource;
  final ForgotPasswordData forgotPasswordData;

  AuthRepo({
    required this.loginDataSource,
    required this.forgotPasswordData,
    required this.signUpDataSource,
  });

  Future<Either<String, LoginResponse>> loginUser(LoginRequest params) async {
    try {
      final response = await loginDataSource.loginUser(params);

      return Right(response);
    } on TimeoutException catch (e) {

      return Left(e.message ?? 'Timeout occurred');
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, LoginResponse>> signUpUser(SignUpRequest params) async {
    try {
      final response = await signUpDataSource.signUpUser(params);
      return Right(response);
    } on TimeoutException catch (e) {
      return Left(e.message ?? 'Timeout occurred');
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, ForgotPasswordResponse>> forgotPassword(ForgotPasswordRequest params) async {
    try {
      final response = await forgotPasswordData.forgotPassword(params);
      return Right(response);
    } on TimeoutException catch (e) {
      return Left(e.message ?? 'Timeout occurred');
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, LoginResponse>> resetPassword(ResetPasswordRequest params) async {
    try {
      final response = await forgotPasswordData.resetPassword(params);
      return Right(response);
    } on TimeoutException catch (e) {
      return Left(e.message ?? 'Timeout occurred');
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}