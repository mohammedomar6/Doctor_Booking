import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:doctor_booking1/features/company/data/data_sources/remote_data_source_company.dart';
import 'package:doctor_booking1/features/company/data/models/company_model.dart';

class CompanyRepo {
final  RemoteDataSourceCompany remoteDataSourceCompany ;

  CompanyRepo({required this.remoteDataSourceCompany});
Future<Either<String, CompanyModel>> getAllCompany() async {
  try {
    final response = await remoteDataSourceCompany.getAllCompany();

    return Right(response);
  } on TimeoutException catch (e) {

    return Left(e.message ?? 'Timeout occurred');
  } on Exception catch (e) {
    return Left(e.toString());
  }
}
}