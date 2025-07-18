import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/booking/data/models/available_date_model.dart';
import 'package:doctor_booking1/features/booking/data/models/user_appointment_model.dart';
import 'package:doctor_booking1/features/booking/data/repository/available_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'available_booking_event.dart';

part 'available_booking_state.dart';

class AvailableBookingBloc
    extends Bloc<AvailableBookingEvent, AvailableBookingState> {
  AvailableBookingBloc() : super(AvailableBookingState()) {
    on<GetAvailableDatesEvent>((event, emit) async {
      emit(state.copyWith(availableStatus: Status.loading));
      final result = await BookingRepo().getAvailableDatesRepo(event.doctorId);
      result.fold(
        (l) {
          print("Failed to load slots: $l");
          emit(state.copyWith(availableStatus: Status.failed));
        },
        (r) {
          print("Loaded slots count: ${r.length}");
          print("Slots list: $r");
          emit(state.copyWith(
            availableStatus: Status.success,
            slotsList: r,
          ));
        },
      );
    });

    on<SelectSlotEvent>((event, emit) {
      emit(state.copyWith(
        selectedSlot: event.selectedSlot,
      ));
    });

    on<ConfirmBookingEvent>((event, emit) async {
      emit(state.copyWith(availableStatus: Status.loading));

      final result = await BookingRepo().confirmBookingRepo(
        doctorId: event.doctorId,
        date: event.slot.date,
        price: event.price,
      );

      result.fold(
        (error) => emit(state.copyWith(
          availableStatus: Status.failed,
        )),
        (slot) => emit(state.copyWith(
          availableStatus: Status.success,
          selectedSlot: slot,
        )),
      );
    });
    on<LoadUserAppointments>((event, emit) async {
      emit(state.copyWith(userStatus: Status.loading));
      try {
        final result = await BookingRepo().getAppointments();
        result.fold(
          (error) => emit(state.copyWith(userStatus: Status.failed)),
          (appointments) => emit(state.copyWith(
            userStatus: Status.success,
            appointments: appointments,
          )),
        );
      } catch (e) {
        emit(state.copyWith(userStatus: Status.failed));
      }
    });
  }
}
