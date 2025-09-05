part of 'medical_history_bloc.dart';

@immutable
sealed class MedicalHistoryEvent {}
class GetMedicalHistoryEvent extends MedicalHistoryEvent {

}
class GetAllIdionallForUserEvent extends MedicalHistoryEvent {
 final  String recordId;

 GetAllIdionallForUserEvent({required this.recordId});
}
class UploadFileEvent extends MedicalHistoryEvent {
  final UploadAdditionallFIleModel  additionallFIleModel ;
  final String recordId ;
  final String additionalId ;

  UploadFileEvent( {required this.recordId, required this.additionalId,required this.additionallFIleModel});

}