part of 'home_bloc.dart';

class HomeState {
  final Status docStatus;
  final List<DoctorModel> doctorModelList;
  final DoctorModel? doctorModel;
  final Status depStatus;
  final List<DepartmentModel> departmentList;

  HomeState({
    this.doctorModel,
    this.docStatus = Status.initial,
    this.doctorModelList = const [],
    this.depStatus = Status.initial,
    this.departmentList = const [],
  });

  HomeState copyWith({
    Status? docStatus,
    List<DoctorModel>? doctorModelList,
    DoctorModel? doctorModel,
    Status? depStatus,
    List<DepartmentModel>? departmentList,
  }) {
    return HomeState(
      doctorModel: doctorModel ?? this.doctorModel,
      docStatus: docStatus ?? this.docStatus,
      doctorModelList: doctorModelList ?? this.doctorModelList,
      depStatus: depStatus ?? this.depStatus,
      departmentList: departmentList ?? this.departmentList,
    );
  }
}
