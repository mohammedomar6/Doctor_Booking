import 'package:dartz/dartz.dart';
import 'package:doctor_booking1/features/booking/data/datasource/available_data_source.dart';
import 'package:doctor_booking1/features/booking/data/models/available_date_model.dart';


class BookingRepo {
  Future<Either<String, List<AvailableDateModel>>> getAvailableDatesRepo(
      String doctorId) async {
    try {
      final result = await AvailableBookingData().getAvailableDates(doctorId);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, Unit>> bookDateRepo(
      String doctorId, DateTime date) async {
    try {
      await AvailableBookingData().bookDate(doctorId: doctorId, date: date);
      return Right(unit);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
