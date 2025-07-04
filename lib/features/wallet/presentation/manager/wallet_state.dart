part of 'wallet_bloc.dart';

@immutable

@immutable
enum Status { success, failed, loading, initial }


class WalletState {
  final Status? status;

  final String? massage ;
  final  WalletResponse? walletResponse;


  const WalletState({

    this.status,
    this.walletResponse,
    this.massage
  });

  WalletState copyWith({
    Status? status,

    WalletResponse? walletResponse,
    String? massage,
  }) {
    return WalletState(
      status: status ?? this.status,
       walletResponse: walletResponse ?? this.walletResponse,
      massage: massage ?? this.massage,
    );
  }
}


