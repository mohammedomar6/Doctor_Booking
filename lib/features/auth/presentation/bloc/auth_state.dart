part of 'auth_bloc.dart';
enum Status { success, failed, loading, initial }

@immutable
class AuthState {
  final Status status;
  final Status statusLogin;
  final Status statusSignUp;
  final Status statusSendEmail;
  final Status statusResetPass;
  final String? message;
  final String? name;
  final String? email;
  final String? token;
  final String?  url;

  const AuthState( {
    this.statusSendEmail=Status.initial,
    this.statusResetPass=Status.initial,
    this.token,
    this.url,
    this.status = Status.initial,
    this.statusLogin = Status.initial,
    this.statusSignUp = Status.initial,
    this.message,
    this.name,
    this.email,
  });

  AuthState copyWith({
    Status? status,
    Status? statusLogin,
    Status? statusSignUp,
    Status? statusSendEmail,
    Status? statusResetPass,
    String? message,
    String? name,
    String? email,
    String? token,
    String? url,
  }) {
    return AuthState(
      status: status ?? this.status,
      statusResetPass: statusResetPass?? this.statusResetPass,
      statusSendEmail: statusSendEmail?? this.statusSendEmail,
      statusLogin: statusLogin ??this.statusLogin,
      statusSignUp: statusSignUp ??this.statusSignUp,
      message: message ?? this.message,
      name: name ?? this.name,
      email: email ?? this.email,
      url: url ?? this.url,
      token: token ?? this.token,
    );
  }
}
