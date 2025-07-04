import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:doctor_booking1/features/pataint/data/data_sources/pataint_remote_data_source.dart';
import 'package:doctor_booking1/features/pataint/data/models/pataint_response.dart';
import 'package:doctor_booking1/features/pataint/data/models/patiant_requast.dart';
import 'package:doctor_booking1/features/pataint/data/models/profile_response.dart';

import '../../../medical_history/data/models/medical_history_response.dart';
import '../data_sources/pataint_remote_data_source.dart';

class PataintRepo {
  final PataintRemoteDataSource pataintRemoteDataSource ;

  PataintRepo({required this.pataintRemoteDataSource});

  Future<Either<String, PataintResponse>> createPataint(PataintRequast request) async {
    try {
      final response = await pataintRemoteDataSource.createPataint(request);

      return Right(response);
    } on TimeoutException catch (e) {

      return Left(e.message ?? 'Timeout occurred');
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, PataintResponse>> updatePataint(PataintRequast request) async {
    try {
      final response = await pataintRemoteDataSource.UpdatePataint(request);

      return Right(response);
    } on TimeoutException catch (e) {

      return Left(e.message ?? 'Timeout occurred');
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, ProfileResponse>> getProfile() async {
    try {
      final response = await pataintRemoteDataSource.getProfile();

      return Right(response);
    } on TimeoutException catch (e) {

      return Left(e.message ?? 'Timeout occurred');
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}