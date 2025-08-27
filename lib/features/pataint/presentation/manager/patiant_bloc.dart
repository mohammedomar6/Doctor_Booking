import 'package:bloc/bloc.dart';
import 'package:doctor_booking1/features/pataint/data/models/pataint_response.dart';
import 'package:doctor_booking1/features/pataint/data/models/patiant_requast.dart';
import 'package:doctor_booking1/features/pataint/data/models/profile_response.dart';
import 'package:doctor_booking1/features/pataint/data/repositories/pataint_repo.dart';
import 'package:meta/meta.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';

part 'patiant_event.dart';

part 'patiant_state.dart';

class PatiantBloc extends Bloc<PatiantEvent, PatiantState> {
  final PataintRepo pataintRepo;

  PatiantBloc({required this.pataintRepo}) : super(PatiantState()) {
    on<PatiantEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<CreatePatientEvent>(
      (event, emit) async {
        emit(state.copyWith(status: Status.loading));
        final res = await pataintRepo.createPataint(PataintRequast(
            firstName: event.firstName,
            lastName: event.lastName,
            information: event.information!,
            phone: event.phone,
            adderss: event.address,
            sex: event.sex,
            insurance: event.insurance,
            imageInsurance: event.insurancePhoto,
            blood: event.blood,
            birthDay: event.birthDay,
            photo: event.photoPath));
        res.fold(
          (l) {
            emit(
              state.copyWith(status: Status.failed, massage: l),
            );
          },
          (r) {
            emit(state.copyWith(
                status: Status.success,
                massage: 'Successfully',
                pataintResponse: r));
          },
        );
      },
    );
    on<GetProfilePataintEvent>(
      (event, emit) async {
        emit(state.copyWith(status: Status.loading));
        final res = await pataintRepo.getProfile();
        res.fold(
          (l) {
            emit(
              state.copyWith(status: Status.failed, massage: l),
            );
          },
          (r) {
            emit(state.copyWith(
                status: Status.success, massage: r.status, profileResponse: r));
          },
        );
      },
    );
    on<UpdatePatientEvent>(
      (event, emit) async {
        emit(state.copyWith(status: Status.loading));
        final res = await pataintRepo.updatePataint(PataintRequast(
            firstName: event.pataintRequast.firstName,
            lastName: event.pataintRequast.lastName,
            information: event.pataintRequast.information,
            phone: event.pataintRequast.phone,
            adderss: event.pataintRequast.adderss,
            sex: event.pataintRequast.sex,
            insurance: event.pataintRequast.insurance,
            imageInsurance: event.pataintRequast.imageInsurance,
            blood: event.pataintRequast.blood,
            birthDay: event.pataintRequast.birthDay,
            photo: event.pataintRequast.photo));
        res.fold(
          (l) {
            emit(
              state.copyWith(status: Status.failed, massage: l),
            );
          },
          (r) {
            emit(state.copyWith(
                status: Status.success,
                massage: 'Successfully',
                pataintResponse: r));
          },
        );
      },
    );
  }
}
