part of 'medical_history_bloc.dart';

@immutable
enum Status { success, failed, loading, initial }

@immutable
class MedicalHistoryState {
  final Status? status;
  final Status? statusAddionll;
  final Status? uploadFile;
 final AdditionallResponseModel? additionallResponseModel ;
  final MedicalHistoryResponse? medicalHistoryResponse;
  final String? massage ;


  const MedicalHistoryState( {
   this.status,
    this.additionallResponseModel ,
    this.statusAddionll,
    this.uploadFile,
    this.medicalHistoryResponse,
    this.massage
  });

  MedicalHistoryState copyWith({
    Status? status,
    Status? statusAddionll,
    Status? uploadFile,
    AdditionallResponseModel? additionallResponseModel,
    MedicalHistoryResponse? medicalHistoryResponse,
    String? massage,
  }) {
    return MedicalHistoryState(
      status: status ?? this.status,
      statusAddionll: statusAddionll ?? this.statusAddionll,
      uploadFile: uploadFile ?? this.uploadFile,
      additionallResponseModel:
          additionallResponseModel ?? this.additionallResponseModel,
      medicalHistoryResponse:
          medicalHistoryResponse ?? this.medicalHistoryResponse,
      massage: massage ?? this.massage,
    );
  }
}

