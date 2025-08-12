part of 'doctor_table_bloc.dart';

@immutable



class DoctorTableState {
  final Status? doctorTableStatus;
  final  DoctorTabelReponse?  doctorTabelReponse;
  final String? massage ;

  DoctorTableState({this.massage ,this.doctorTableStatus,  this.doctorTabelReponse});



  DoctorTableState copyWith({
     Status? doctorTableStatus,
    String? massage,
      DoctorTabelReponse?  doctorTabelReponse
  }) {
    return DoctorTableState(
      massage: massage??this.massage,
      doctorTableStatus: doctorTableStatus ?? this.doctorTableStatus,
      doctorTabelReponse: doctorTabelReponse ?? this.doctorTabelReponse,
    );
  }
}
