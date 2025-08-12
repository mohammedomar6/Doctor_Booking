import 'package:dartz/dartz.dart';
import 'package:doctor_booking1/features/booking/data/datasource/remote_data_source_doctor_tabel.dart';

import '../models/doctor_tabel_response.dart';

class DoctorTabelRepo {
final RemoteDataSourceDoctorTabel remoteDataSourceDoctorTabel ;

  DoctorTabelRepo({required this.remoteDataSourceDoctorTabel});


  Future<Either<String, DoctorTabelReponse>> getDoctorTabelRepo() async {
    try {
      final result = await remoteDataSourceDoctorTabel.getDoctorTabels();
      return Right(result);
    } catch (e) {
      return Left(e.toString());
    }
  }
}