import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:doctor_booking1/features/wallet/data/data_sources/remote_data_source_wallet.dart';
import 'package:doctor_booking1/features/wallet/data/models/wallet_response.dart';

class WalletRepo {
  final RemoteDataSourceWallet remoteDataSourceWallet ;

  WalletRepo({required this.remoteDataSourceWallet});
  Future<Either<String, WalletResponse>> getWallet() async {
    try {
      final response = await remoteDataSourceWallet.getWallet();

      return Right(response);
    } on TimeoutException catch (e) {

      return Left(e.message ?? 'Timeout occurred');
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }

}