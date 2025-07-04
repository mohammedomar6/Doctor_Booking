part of 'medical_history_bloc.dart';

@immutable
enum Status { success, failed, loading, initial }

@immutable
class MedicalHistoryState {
  final Status? status;
  final MedicalHistoryResponse? medicalHistoryResponse;
  final String? massage ;


  const MedicalHistoryState({
   this.status,
    this.medicalHistoryResponse,
    this.massage
  });

  MedicalHistoryState copyWith({
    Status? status,
    MedicalHistoryResponse? medicalHistoryResponse,
    String? massage,
  }) {
    return MedicalHistoryState(
      status: status ?? this.status,
      medicalHistoryResponse: medicalHistoryResponse ?? this.medicalHistoryResponse,
        massage: massage ?? this.massage,
    );
  }
}

