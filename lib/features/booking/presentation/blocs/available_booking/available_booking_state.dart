part of 'available_booking_bloc.dart';

class AvailableBookingState {
  final Status availableStatus;
  final List<AvailableDateModel> slotsList;
  final AvailableDateModel? selectedSlot;

  AvailableBookingState({
    this.availableStatus = Status.initial,
    this.slotsList = const [],
    this.selectedSlot,
  });

  AvailableBookingState copyWith({
    Status? availableStatus,
    List<AvailableDateModel>? slotsList,
    AvailableDateModel? selectedSlot,
  }) {
    return AvailableBookingState(
      availableStatus: availableStatus ?? this.availableStatus,
      slotsList: slotsList ?? this.slotsList,
      selectedSlot: selectedSlot ?? this.selectedSlot,
    );
  }
}
