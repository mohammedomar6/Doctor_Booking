import 'package:bloc/bloc.dart';
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
  }
}
