import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/booking/presentation/blocs/available_booking/available_booking_bloc.dart';
import 'package:doctor_booking1/features/booking/presentation/widgets/confirm_booking_button.dart';
import 'package:doctor_booking1/features/booking/presentation/widgets/confirm_dialog.dart';
import 'package:doctor_booking1/features/booking/presentation/widgets/date_picker_tile.dart';
import 'package:doctor_booking1/features/booking/presentation/widgets/doctor_header.dart';
import 'package:doctor_booking1/features/booking/presentation/widgets/no_slots_available.dart';
import 'package:doctor_booking1/features/booking/presentation/widgets/time_slots_grid.dart';
import 'package:doctor_booking1/features/booking/presentation/widgets/time_slots_header.dart';
import 'package:doctor_booking1/features/wallet/data/data_sources/remote_data_source_wallet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../medical_history/presentation/manager/medical_history_bloc.dart';

class AddAppointmentConfirmationPage extends StatefulWidget {
  final String doctorId, doctorName, specialty, imagePath;
  final int price;

  const AddAppointmentConfirmationPage({
    super.key,
    required this.doctorId,
    required this.doctorName,
    required this.specialty,
    required this.imagePath,
    required this.price,
  });

  @override
  State<AddAppointmentConfirmationPage> createState() =>
      _AddAppointmentConfirmationPageState();
}

class _AddAppointmentConfirmationPageState
    extends State<AddAppointmentConfirmationPage> {
  final walletDataSource = RemoteDataSourceWallet();
  final ScrollController _timeScrollController = ScrollController();
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  @override
  void initState() {
    super.initState();
    context
        .read<AvailableBookingBloc>()
        .add(GetAvailableDatesEvent(widget.doctorId));
  }

  @override
  void dispose() {
    _timeScrollController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final state = context.read<AvailableBookingBloc>().state;
    final availableDates = state.slotsList.map((slot) => slot.dateOnly).toSet();

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
      selectableDayPredicate: (DateTime date) {
        return availableDates
            .contains(DateTime(date.year, date.month, date.day));
      },
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
        _selectedTime = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirm Appointment'),
        backgroundColor: MyColours.white,
        foregroundColor: MyColours.black,
        elevation: 0,
      ),
      body: BlocBuilder<AvailableBookingBloc, AvailableBookingState>(
        builder: (context, state) {
          final availableSlots = _selectedDate != null
              ? state.slotsList
                  .where((slot) => slot.dateOnly == _selectedDate)
                  .toList()
              : [];

          return Padding(
            padding: EdgeInsets.all(context.screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                DoctorHeader(
                  doctorName: widget.doctorName,
                  specialty: widget.specialty,
                  imagePath: widget.imagePath,
                ),
                const Divider(),
                DatePickerTile(
                  selectedDate: _selectedDate,
                  onTap: () => _selectDate(context),
                ),
                if (_selectedDate != null) ...[
                  const TimeSlotsHeader(),
                  Expanded(
                    child: availableSlots.isEmpty
                        ? const NoSlotsAvailable()
                        : TimeSlotsGrid(
                            availableSlots: availableSlots,
                            selectedTime: _selectedTime,
                            onTimeSelected: (time) {
                              setState(() => _selectedTime = time);
                            },
                          ),
                  ),
                ],
                const Spacer(),
                ConfirmBookingButton(
                  isEnabled: _selectedDate != null && _selectedTime != null,
                  isProcessing: state.availableStatus == Status.loading,
                  onPressed: () async {
                    if (_selectedDate == null || _selectedTime == null) return;

                    final confirmed = await showConfirmDialog(
                      context,
                      amount: widget.price,
                      selectedDate: _selectedDate!,
                      selectedTime:
                          '${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}',
                    );

                    if (confirmed != true) return;

                    try {
                      await walletDataSource.withdrawFromWallet(widget.price);

                      final selectedSlot = state.slotsList.firstWhere(
                        (slot) =>
                            slot.dateOnly == _selectedDate &&
                            slot.hour == _selectedTime!.hour &&
                            slot.minute == _selectedTime!.minute,
                      );

                      context.read<AvailableBookingBloc>().add(
                            ConfirmBookingEvent(
                              doctorId: widget.doctorId,
                              slot: selectedSlot,
                            ),
                          );

                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Appointment confirmed for ${DateFormat('MMM d, yyyy').format(_selectedDate!)} at ${_selectedTime!.hour}:${_selectedTime!.minute.toString().padLeft(2, '0')}',
                          ),
                        ),
                      );
                      Navigator.pop(context);
                    } catch (e) {
                      if (!mounted) return;
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Booking failed: ${e.toString()}'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
