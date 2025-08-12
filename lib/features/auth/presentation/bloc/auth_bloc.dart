import 'package:doctor_booking1/features/auth/data/models/forgot_password_request.dart';
import 'package:doctor_booking1/features/auth/data/models/login_request.dart';
import 'package:doctor_booking1/features/auth/data/models/reset_password_request.dart';
import 'package:doctor_booking1/features/auth/data/models/sign_up_request.dart';
import 'package:doctor_booking1/features/auth/data/repository/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo authRepositories;
  AuthBloc({required this.authRepositories}) : super(AuthState()) {
    on<AuthEvent>((event, emit) {});
    on<LoginEvent>((event, emit) async {
      print('load load lo');
      emit(state.copyWith(statusLogin: Status.loading));
      try {
        final response = await authRepositories.loginUser(
          LoginRequest(email: event.email, password: event.password),
        );
        response.fold(
          (error) {
            print('fffff');
            emit(
              state.copyWith(
                statusLogin: Status.failed,
              message: error,
            ),
            );
          },
          (success) {
            print('ssssssssss');
            emit(
              state.copyWith(
                statusLogin: Status.success,
              message: "Login successful",
              email: success.user.email,
              token: success.token,
            ),
            );
          },
        );
      } catch (e) {
        emit(
          state.copyWith(
            statusLogin: Status.failed,
            message: e.toString(),
          ),
        );
      }
    });
    on<SignUpEvent>((event, emit) async {
      emit(state.copyWith(statusSignUp: Status.loading));
      try {
        final response = await authRepositories.signUpUser(
          SignUpRequest(
            name: event.name,
            email: event.email,
            password: event.password,
          ),
        );
        response.fold(
          (error) => emit(
            state.copyWith(
              statusSignUp: Status.failed,
              message: error,
            ),
          ),
          (success) => emit(
            state.copyWith(
                statusSignUp: Status.success,
                message: "Sign up successful",
                email: success.user.email,
                token: success.token),
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            statusSignUp: Status.failed,
            message: e.toString(),
          ),
        );
      }
    });
    on<ForgotPasswordEvent>(
      (event, emit) async {
        emit(state.copyWith(statusSendEmail: Status.loading));
        try {
          final response = await authRepositories
              .forgotPassword(ForgotPasswordRequest(email: event.email));
          response.fold(
            (error) {

              emit(state.copyWith(
                  statusSendEmail: Status.failed,
                  message: error.toString()));
            },
            (success) {
              emit(state.copyWith(
                  statusSendEmail: Status.success,
                  url: success.url,
                  message: success.message));
            },
          );
        } on Exception catch (e) {
          emit(
            state.copyWith(
              statusSendEmail: Status.failed,
              message: e.toString(),
            ),
          );
        }
      },
    );
    on<ResetPasswordEvent>(
      (event, emit) async {
        try {
          emit(state.copyWith(statusResetPass: Status.loading));
          final response = await authRepositories
              .resetPassword(ResetPasswordRequest(password: event.password));
          response.fold(
            (error) {
              emit(state.copyWith(
                  statusResetPass: Status.failed,
                  message: error.toString()));
            },
            (success) {
              emit(state.copyWith(
                statusResetPass: Status.success,
                token: success.token,
              ));
            },
          );
        } on Exception catch (e) {
          emit(
            state.copyWith(
              statusResetPass: Status.failed,
              message: e.toString(),
            ),
          );
        }
      },
    );
  }
}
