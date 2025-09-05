import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:doctor_booking1/features/medical_history/data/data_sources/medical_history_data_source.dart';
import 'package:doctor_booking1/features/medical_history/data/models/medical_history_response.dart';
import 'package:doctor_booking1/features/medical_history/data/models/upload_additionl_file_model.dart';

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
  Future<Either<String, MedicalHistoryResponse?>> getAllAdditionallRecord(int recordId) async {
    try {
      final response = await medicalHistoryData.getALlAdditional(recordId);

      return Right(response);
    } on TimeoutException catch (e) {

      return Left(e.message ?? 'Timeout occurred');
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, void>> uploadFile(int recordId, int additionallId ,UploadAdditionallFIleModel request) async {
    try {
      final response = await medicalHistoryData.uploadFile(recordId, additionallId, request);

      return Right(response);
    } on TimeoutException catch (e) {

      return Left(e.message ?? 'Timeout occurred');
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}