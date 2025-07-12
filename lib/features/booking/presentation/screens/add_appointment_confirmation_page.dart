// import 'package:doctor_booking1/constant/my_colours.dart';
// import 'package:doctor_booking1/core/responsive.dart';
// import 'package:doctor_booking1/features/booking/data/models/available_date_model.dart';
// import 'package:doctor_booking1/features/booking/presentation/blocs/available_booking/available_booking_bloc.dart';
// import 'package:doctor_booking1/features/booking/presentation/widgets/appointment_date_tile.dart';
// import 'package:doctor_booking1/features/booking/presentation/widgets/available_time_selector.dart';
// import 'package:doctor_booking1/features/booking/presentation/widgets/confirm_booking_button.dart';
// import 'package:doctor_booking1/features/booking/presentation/widgets/confirm_dialog.dart';
// import 'package:doctor_booking1/features/booking/presentation/widgets/doctor_header.dart';
// import 'package:doctor_booking1/features/wallet/data/data_sources/remote_data_source_wallet.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:intl/intl.dart';
//
// import '../../../medical_history/presentation/manager/medical_history_bloc.dart';
//
// class AddAppointmentConfirmationPage extends StatefulWidget {
//   final String doctorId;
//   final String doctorName;
//   final String specialty;
//   final String imagePath;
//   final int price;
//
//   const AddAppointmentConfirmationPage({
//     super.key,
//     required this.doctorId,
//     required this.doctorName,
//     required this.specialty,
//     required this.imagePath,
//     required this.price,
//   });
//
//   @override
//   State<AddAppointmentConfirmationPage> createState() =>
//       _AddAppointmentConfirmationPageState();
// }
//
// class _AddAppointmentConfirmationPageState
//     extends State<AddAppointmentConfirmationPage> {
//   final RemoteDataSourceWallet walletDataSource = RemoteDataSourceWallet();
//
//   @override
//   void initState() {
//     super.initState();
//     BlocProvider.of<AvailableBookingBloc>(context)
//         .add(GetAvailableDatesEvent(widget.doctorId));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('تأكيد الحجز'),
//         backgroundColor: MyColours.white,
//         foregroundColor: MyColours.black,
//         elevation: 0,
//       ),
//       body: BlocBuilder<AvailableBookingBloc, AvailableBookingState>(
//         builder: (context, state) {
//           List<AvailableDateModel> slots = state.slotsList;
//
//           final selectedDate = state.selectedSlot?.dateOnly;
//           final selectedTime = state.selectedSlot?.formattedTime;
//
//           bool isSameDate(DateTime a, DateTime b) =>
//               a.year == b.year && a.month == b.month && a.day == b.day;
//
//           return Padding(
//             padding: EdgeInsets.all(context.screenWidth * 0.05),
//             child: Column(
//               children: [
//                 DoctorHeader(
//                   doctorName: widget.doctorName,
//                   specialty: widget.specialty,
//                   imagePath: widget.imagePath,
//                 ),
//                 const Divider(),
//                 AppointmentDateTile(
//                   selectedDate: selectedDate,
//                   onTap: () async {
//                     final DateTime? picked = await showDatePicker(
//                       context: context,
//                       initialDate: DateTime.now(),
//                       firstDate: DateTime.now(),
//                       lastDate: DateTime.now().add(const Duration(days: 30)),
//                     );
//
//                     if (picked != null && mounted) {
//                       final slotForDate = slots
//                           .where((s) => isSameDate(s.dateOnly, picked))
//                           .toList();
//                       if (slotForDate.isNotEmpty) {
//                         context.read<AvailableBookingBloc>().add(
//                           SelectSlotEvent(slotForDate.first),
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                               content: Text("لا يوجد مواعيد في هذا اليوم")),
//                         );
//                       }
//                     }
//                   },
//                 ),
//                 AvailableTimeSelector(
//                   selectedTime: selectedTime,
//                   onSelected: (time) {
//                     AvailableDateModel? matchingSlot;
//                     try {
//                       matchingSlot = slots.firstWhere(
//                             (s) =>
//                         s.formattedTime == time &&
//                             s.dateOnly == selectedDate,
//                       );
//                     } catch (_) {
//                       matchingSlot = null;
//                     }
//
//                     if (matchingSlot != null) {
//                       context
//                           .read<AvailableBookingBloc>()
//                           .add(SelectSlotEvent(matchingSlot));
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(
//                             content: Text("لا يوجد موعد مطابق لهذا الوقت")),
//                       );
//                     }
//                   },
//                 ),
//                 const Spacer(),
//                 ConfirmBookingButton(
//                   isEnabled: selectedDate != null &&
//                       selectedTime != null &&
//                       state.availableStatus != Status.loading,
//                   isProcessing: state.availableStatus == Status.loading,
//                   onPressed: () async {
//                     final confirmed = await showConfirmDialog(
//                       context,
//                       amount: widget.price,
//                       selectedDate: selectedDate!,
//                       selectedTime: selectedTime!,
//                     );
//                     if (confirmed == true) {
//                       try {
//                         await walletDataSource.withdrawFromWallet(widget.price);
//                         context.read<AvailableBookingBloc>().add(
//                           ConfirmBookingEvent(doctorId: widget.doctorId),
//                         );
//                         context.read<AvailableBookingBloc>().add(
//                           GetAvailableDatesEvent(widget.doctorId),
//                         );
//                         if (context.mounted) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text(
//                                 'تم الحجز بتاريخ ${DateFormat('d MMM yyyy').format(selectedDate)} الساعة $selectedTime',
//                               ),
//                             ),
//                           );
//                           Navigator.pop(context);
//                         }
//                       } catch (e) {
//                         if (context.mounted) {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('فشل الدفع: ${e.toString()}'),
//                               backgroundColor: Colors.red,
//                             ),
//                           );
//                         }
//                       }
//                     }
//                   },
//                 ),
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/core/responsive.dart';
import 'package:doctor_booking1/features/wallet/data/data_sources/remote_data_source_wallet.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/doctor_header.dart';
import '../widgets/appointment_date_tile.dart';
import '../widgets/available_time_selector.dart';
import '../widgets/confirm_booking_button.dart';
import '../widgets/confirm_dialog.dart';

class AddAppointmentConfirmationPage extends StatefulWidget {
  final String doctorName;
  final String doctorId;
  final String specialty;
  final String imagePath;
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
  DateTime? selectedDate;
  String? selectedTime;
  bool isProcessing = false;

  final RemoteDataSourceWallet walletDataSource = RemoteDataSourceWallet();

  void pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 30)),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  void confirmBooking() async {
    setState(() => isProcessing = true);

    try {
      await walletDataSource.withdrawFromWallet(widget.price);

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'تم الحجز بتاريخ ${DateFormat('d MMM yyyy').format(selectedDate!)} الساعة $selectedTime',
          ),
        ),
      );

      Navigator.pop(context);
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('فشل الدفع: ${e.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      if (mounted) {
        setState(() => isProcessing = false);
      }
    }
  }

  void showConfirmationDialog() async {
    if (selectedDate == null || selectedTime == null) return;

    final confirmed = await showConfirmDialog(
      context,
      amount: widget.price,
      selectedDate: selectedDate!,
      selectedTime: selectedTime!,
    );
    if (confirmed == true) confirmBooking();
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
      body: Padding(
        padding: EdgeInsets.all(context.screenWidth * 0.05),
        child: Column(
          children: [
            DoctorHeader(
              doctorName: widget.doctorName,
              specialty: widget.specialty,
              imagePath: widget.imagePath,
            ),
            const Divider(),
            AppointmentDateTile(
              selectedDate: selectedDate,
              onTap: pickDate,
            ),
            AvailableTimeSelector(
              selectedTime: selectedTime,
              onSelected: (time) => setState(() => selectedTime = time),
            ),
            const Spacer(),
            ConfirmBookingButton(
              isEnabled:
                  selectedDate != null && selectedTime != null && !isProcessing,
              isProcessing: isProcessing,
              onPressed: showConfirmationDialog,
            )
          ],
        ),
      ),
    );
  }
}
