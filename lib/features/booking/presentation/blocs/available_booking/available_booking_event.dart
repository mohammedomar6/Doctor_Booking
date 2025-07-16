part of 'available_booking_bloc.dart';

class AvailableBookingEvent {}

class GetAvailableDatesEvent extends AvailableBookingEvent {
  final String doctorId;

  GetAvailableDatesEvent(this.doctorId);
}

class SelectSlotEvent extends AvailableBookingEvent {
  final AvailableDateModel selectedSlot;

  SelectSlotEvent(this.selectedSlot);
}

class ConfirmBookingEvent extends AvailableBookingEvent {
  final String doctorId;
  final AvailableDateModel slot;
  final int price;

  ConfirmBookingEvent({
    required this.doctorId,
    required this.slot,
    required this.price,
  });
}
class LoadUserAppointments extends AvailableBookingEvent {}
