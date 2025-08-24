import 'dart:async';

import 'package:dartz/dartz.dart';

import '../data_sources/remote_data_source_review.dart';
import '../models/review_request_model.dart';
import '../models/review_response_model.dart';

class ReviewRepo {
  final RemoteDataSourceReview   remoteDataSourceReview;

  ReviewRepo({required this.remoteDataSourceReview});

  Future<Either<String, ReviewReponseModel>> addReview(ReviewRequestModel request) async {
    try {
      final response = await remoteDataSourceReview.addReview(request);

      return Right(response);
    } on TimeoutException catch (e) {

      return Left(e.message ?? 'Timeout occurred');
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}