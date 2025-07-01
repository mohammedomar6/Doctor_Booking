import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/booking/data/repository/departments_repository.dart';
import 'package:doctor_booking1/features/home/data/models/department_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'departments_event.dart';

part 'departments_state.dart';

class DepartmentsBloc extends Bloc<DepartmentsEvent, DepartmentsState> {
  DepartmentsBloc() : super(DepartmentsState()) {
    on<GetAllDepartmentsBooking>((event, emit) async {
      emit(state.copyWith(depStatusBook: Status.loading));
      print('llldd');
      final result = await DepartmentsRepo().getAllDepartmentsRepo();
      result.fold(
        (l) {
          print('Failed to fetch departments boooook');
          emit(state.copyWith(depStatusBook: Status.failed));
        },
        (r) {
          print('Departments loaded successfully booooooooook');
          emit(state.copyWith(
              depStatusBook: Status.success, departmentListBook: r));
        },
      );
    });
    on<DepartmentsEvent>((event, emit) {});
  }
}
