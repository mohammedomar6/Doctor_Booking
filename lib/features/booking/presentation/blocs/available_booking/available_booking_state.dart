part of 'available_booking_bloc.dart';

class AvailableBookingState {
  final Status availableStatus;
  final Status userStatus;
  final List<AvailableDateModel> slotsList;
  final AvailableDateModel? selectedSlot;
  final List<UserAppointmentModel> appointments;
  final UserAppointmentModel? lastAppointment;

  AvailableBookingState({
    this.appointments = const [],
    this.availableStatus = Status.initial,
    this.userStatus = Status.initial,
    this.slotsList = const [],
    this.selectedSlot,
    this.lastAppointment,
  });

  AvailableBookingState copyWith({
    Status? userStatus,
    Status? availableStatus,
    List<AvailableDateModel>? slotsList,
    AvailableDateModel? selectedSlot,
    List<UserAppointmentModel>? appointments,
    UserAppointmentModel? lastAppointment,
  }) {
    return AvailableBookingState(
      userStatus: userStatus ?? this.userStatus,
      availableStatus: availableStatus ?? this.availableStatus,
      slotsList: slotsList ?? this.slotsList,
      selectedSlot: selectedSlot ?? this.selectedSlot,
      appointments: appointments ?? this.appointments,
      lastAppointment: lastAppointment ?? this.lastAppointment,
    );
  }
}