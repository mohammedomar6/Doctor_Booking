import 'package:bloc/bloc.dart';
import 'package:doctor_booking1/features/booking/data/repository/doctor_tabel_repo.dart';
import 'package:meta/meta.dart';

import '../../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../data/models/doctor_tabel_response.dart';

part 'doctor_table_event.dart';
part 'doctor_table_state.dart';

class DoctorTableBloc extends Bloc<DoctorTableEvent, DoctorTableState> {
 final  DoctorTabelRepo doctorTabelRepo;
  DoctorTableBloc(this.doctorTabelRepo) : super(DoctorTableState().copyWith(doctorTableStatus: Status.initial)) {
    on<DoctorTableEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<GetDoctorTable>((event, emit)async {
      emit(state.copyWith(doctorTableStatus: Status.loading));
       try {
         final  result= await  doctorTabelRepo.getDoctorTabelRepo();
         result.fold((l) {
           emit(state.copyWith(doctorTableStatus: Status.failed,massage: l));
         },
         (r) {
           emit(state.copyWith(massage: 'succsessfully',doctorTableStatus: Status.success,doctorTabelReponse: r));
         },);
       } on Exception catch (e) {
         emit(state.copyWith(doctorTableStatus: Status.failed,massage: e.toString()));
       }

    },);
  }

}
