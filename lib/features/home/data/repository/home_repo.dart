import 'package:dartz/dartz.dart';
import 'package:doctor_booking1/features/home/data/datasource/home_datasource.dart';
import 'package:doctor_booking1/features/home/data/models/department_model.dart';
import 'package:doctor_booking1/features/home/data/models/doctor_models.dart';

class RepoHome {
  Future<Either<String, List<DoctorModel>>> getAllDocRepo() async {
    try {
      final result = await HomeData().getAllDoctors();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, DoctorModel>> getOneDocRepo(String id) async {
    try {
      final result = await HomeData().getDoctorById(id);
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<DepartmentModel>>> getAllDepartmentsRepo() async {
    try {
      final result = await HomeData().getAllDepartmentsHome();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
