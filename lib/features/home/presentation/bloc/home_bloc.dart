import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/home/data/models/department_model.dart';
import 'package:doctor_booking1/features/home/data/models/doctor_models.dart';
import 'package:doctor_booking1/features/home/data/repository/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<GetAllDepartmentsEvent>((event, emit) async {
      emit(state.copyWith(depStatus: Status.loading));
      final result = await RepoHome().getAllDepartmentsRepo();
      result.fold(
            (l) {
          print('Failed to fetch departments');
          emit(state.copyWith(depStatus: Status.failed));
        },
            (r) {
          print('Departments loaded successfully');
          emit(state.copyWith(depStatus: Status.success, departmentList: r));
        },
      );
    });
    on<GetAllDocEvent>((event, emit) async {
      print('aaaaaaaaaaa');
      emit(state.copyWith(docStatus: Status.loading));
      final result = await RepoHome().getAllDocRepo();
      result.fold((l) {
        print('ho failed');
        emit(state.copyWith(docStatus: Status.failed));
      }, (r) {
        print('ho ssssss');
        emit(state.copyWith(docStatus: Status.success, doctorModelList: r));
      });
    });
    on<GetOneDocEvent>((event, emit) async {
      emit(state.copyWith(docStatus: Status.loading));
      final result = await RepoHome().getOneDocRepo(event.id);
      result.fold((l) {
        print('ho failed');
        emit(state.copyWith(docStatus: Status.failed));
      }, (r) {
        print('ho ssssss');
        emit(state.copyWith(docStatus: Status.success, doctorModel: r));
      });
    });
  }
}
