part of 'home_bloc.dart';

class HomeState {
  final Status docStatus;
  final List<DoctorModel> doctorModelList;
  final DoctorModel? doctorModel;

  HomeState(
      {this.doctorModel,
      this.docStatus = Status.initial,
      this.doctorModelList = const []});

  HomeState copyWith(
      {Status? docStatus,
      List<DoctorModel>? doctorModelList,
      DoctorModel? doctorModel}) {
    return HomeState(
      doctorModel: doctorModel ?? this.doctorModel,
      docStatus: docStatus ?? this.docStatus,
      doctorModelList: doctorModelList ?? this.doctorModelList,
    );
  }
}
