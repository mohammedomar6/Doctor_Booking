import 'package:doctor_booking1/features/auth/data/models/login_requast.dart';
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
          LoginRequast(email: event.email, password: event.password),
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
              status: Status.succses,
              message: "Login successful",
              name: success.user.name,
              email: success.user.email,
              token: success.tokens,
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
              status: Status.succses,
              message: "Sign up successful",
              name: event.name,
              email: event.email,
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