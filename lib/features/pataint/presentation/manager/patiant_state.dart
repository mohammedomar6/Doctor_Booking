part of 'patiant_bloc.dart';


@immutable
enum Status { success, failed, loading, initial }


class PatiantState {
  final Status? status;
  final  PataintResponse? pataintResponse ;
  final String? massage ;
  final  ProfileResponse? profileResponse;


  const PatiantState({
    this.profileResponse,
    this.status,
    this.pataintResponse,
    this.massage
  });

  PatiantState copyWith({
    Status? status,
    PataintResponse? pataintResponse,
    ProfileResponse? profileResponse,
    String? massage,
  }) {
    return PatiantState(
      status: status ?? this.status,
      profileResponse: profileResponse ?? this.profileResponse,
      pataintResponse: pataintResponse ?? this.pataintResponse,
      massage: massage ?? this.massage,
    );
  }
}

