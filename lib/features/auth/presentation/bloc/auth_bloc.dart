import 'package:doctor_booking1/features/auth/data/models/login_request.dart';
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
      emit(state.copyWith(status: Status.loading));
      try {
        final response = await authRepositories.loginUser(
          LoginRequest(email: event.email, password: event.password),

        );
        response.fold(


          (error) => emit(
            state.copyWith(
              status: Status.failed,
              message: error,
            ),
          ),
          (success) => emit(
            state.copyWith(
              status: Status.success,
              message: "Login successful",
              email: success.user.email,
              token: success.token,
            ),
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            status: Status.success,
            message: e.toString(),
          ),
        );
      }
    });
    on<SignUpEvent>((event, emit) async {
      emit(state.copyWith(status: Status.loading));
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
              status: Status.failed,
              message: error,
            ),
          ),
          (success) => emit(
            state.copyWith(
              status: Status.success,
              message: "Sign up successful",
              email: success.user.email,
              token: success.token
            ),
          ),
        );
      } catch (e) {
        emit(
          state.copyWith(
            status: Status.failed,
            message: e.toString(),
          ),
        );
      }
    });
  }
}