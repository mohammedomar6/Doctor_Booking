import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:doctor_booking1/features/wallet/data/data_sources/remote_data_source_wallet.dart';
import 'package:doctor_booking1/features/wallet/data/models/wallet_request.dart';
import 'package:doctor_booking1/features/wallet/data/models/wallet_response.dart';

import '../models/wallet_add_money_model_response.dart';

class WalletRepo {
  final RemoteDataSourceWallet remoteDataSourceWallet;

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

  Future<Either<String, Doc>> withdrawFromWalletRepo(int amount) async {
    try {
      final response = await remoteDataSourceWallet.withdrawFromWallet(amount);
      return Right(response);
    } on TimeoutException catch (e) {
      return Left(e.message ?? 'Timeout occurred');
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
  Future<Either<String, WalletAddMoneyModelResponse>> dispoitFromWalletRepo(WalletRequest req) async {
    try {
      final response = await remoteDataSourceWallet.dispoitFromWallet(req);
      return Right(response);
    } on TimeoutException catch (e) {
      return Left(e.message ?? 'Timeout occurred');
    } on Exception catch (e) {
      return Left(e.toString());
    }
  }
}
