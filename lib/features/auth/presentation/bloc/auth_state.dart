part of 'auth_bloc.dart';
enum Status { success, failed, loading, initial }

@immutable
class AuthState {
  final Status status;
  final String? message;
  final String? name;
  final String? email;
  final String? token;
  final String?  url;

  const AuthState({
    this.token,
    this.url,
    this.status = Status.initial,
    this.message,
    this.name,
    this.email,
  });

  AuthState copyWith({
    Status? status,
    String? message,
    String? name,
    String? email,
    String? token,
    String? url,
  }) {
    return AuthState(
      status: status ?? this.status,
      message: message ?? this.message,
      name: name ?? this.name,
      email: email ?? this.email,
      url: url ?? this.url,
      token: token ?? this.token,
    );
  }
}
