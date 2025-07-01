import 'package:dartz/dartz.dart';
import 'package:doctor_booking1/features/booking/data/datasource/departments_data.dart';
import 'package:doctor_booking1/features/home/data/models/department_model.dart';

class DepartmentsRepo {
  Future<Either<String, List<DepartmentModel>>> getAllDepartmentsRepo() async {
    try {
      final result = await DepartmentsData().getAllDepartmentsBooking();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
