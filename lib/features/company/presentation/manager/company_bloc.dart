import 'package:bloc/bloc.dart';
import 'package:doctor_booking1/features/company/data/models/company_model.dart';
import 'package:doctor_booking1/features/company/data/repositories/company_repo.dart';
import 'package:meta/meta.dart';

import '../../../pataint/presentation/manager/patiant_bloc.dart';

part 'company_event.dart';
part 'company_state.dart';

class CompanyBloc extends Bloc<CompanyEvent, CompanyState> {
  final CompanyRepo companyRepo;
  CompanyBloc(this.companyRepo) : super(CompanyState()) {
    on<CompanyEvent>((event, emit) {

    });
    on<GetAllCompanyEvent>((event, emit)async {
      emit(state.copyWith(status: Status.loading))    ;
      final res  =await companyRepo.getAllCompany();
                      res.fold((l) {
                       emit( state.copyWith(status: Status.failed,massage: state.massage));
                      }, (r) {
                       emit( state.copyWith(status: Status.success,companyModel: r,massage: r.status));
                      },);
    });
  }
}
