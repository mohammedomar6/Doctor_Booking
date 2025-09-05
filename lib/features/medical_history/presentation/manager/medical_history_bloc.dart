import 'package:bloc/bloc.dart';
import 'package:doctor_booking1/features/medical_history/data/models/additional_response_model.dart';
import 'package:doctor_booking1/features/medical_history/data/models/upload_additionl_file_model.dart';
import 'package:meta/meta.dart';

import '../../data/models/medical_history_response.dart';
import '../../data/repositories/medical_history_repo.dart';

part 'medical_history_event.dart';
part 'medical_history_state.dart';

class MedicalHistoryBloc extends Bloc<MedicalHistoryEvent, MedicalHistoryState> {
  final MedicalHistoryRepo medicalHistoryRepo ;
  MedicalHistoryBloc( {required this.medicalHistoryRepo}) : super(MedicalHistoryState()) {
    on<MedicalHistoryEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetMedicalHistoryEvent>((event, emit)  async{
      emit(state.copyWith(status: Status.loading));
      final res= await medicalHistoryRepo.getMedicalHistory();
      res.fold((l) {
          emit( state.copyWith(massage: 'error for data base',status: Status.failed));

      }, (r) {
      emit(  state.copyWith(
        medicalHistoryResponse: r,
        status: Status.success,

      ));
      },);
    },);
    on<GetAllIdionallForUserEvent>((event, emit)  async{
      emit(state.copyWith(statusAddionll: Status.loading));
      final res= await medicalHistoryRepo.getAllAdditionallRecord(event.recordId);
      res.fold((l) {
          emit( state.copyWith(massage: 'error for data base',statusAddionll: Status.failed));

      }, (r) {
      emit(  state.copyWith(
        additionallResponseModel: r,
        statusAddionll: Status.success,

      ));
      },);
    },);
    on<UploadFileEvent>((event, emit)  async{
      emit(state.copyWith(uploadFile: Status.loading));
      final res= await medicalHistoryRepo.uploadFile(event.recordId, event.additionalId, event.additionallFIleModel);
      res.fold((l) {
          emit( state.copyWith(massage: 'error for data base',uploadFile: Status.failed));

      }, (r) {
      emit(  state.copyWith(
        massage: r,
        uploadFile: Status.success,

      ));
      },);
    },);

  }
}
