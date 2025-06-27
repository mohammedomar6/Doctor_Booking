import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/home/data/models/doctor_models.dart';
import 'package:doctor_booking1/features/home/data/repository/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<HomeEvent>((event, emit) {
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
