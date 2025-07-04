import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:doctor_booking1/features/medical_history/data/data_sources/medical_history_data_source.dart';
import 'package:doctor_booking1/features/medical_history/data/models/medical_history_response.dart';

class MedicalHistoryRepo{

  final MedicalHistoryData  medicalHistoryData ;

  MedicalHistoryRepo({required this.medicalHistoryData});

  Future<Either<String, MedicalHistoryResponse?>> getMedicalHistory() async {
    try {
      final response = await medicalHistoryData.getMedicalHistory();

      return Right(response);
    } on TimeoutException catch (e) {

      return Left(e.message ?? 'Timeout occurred');
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}