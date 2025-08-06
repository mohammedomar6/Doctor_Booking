part of 'wallet_bloc.dart';

class WalletState {
  final Status statusGetWallet;
  final Status statusWithdrawFromWallet;
  final String? message;
  final WalletResponse? walletResponse;
  Status? statusDispoitFromWallet;
  final WalletAddMoneyModelResponse? walletAddMoneyModelResponse ;

  WalletState(
      {this.message,
      this.statusGetWallet = Status.initial,

        this.walletAddMoneyModelResponse ,
        this.statusDispoitFromWallet =Status.initial ,
      this.statusWithdrawFromWallet = Status.initial,
      this.walletResponse});

  WalletState copyWith({
    Status? statusGetWallet,
    WalletAddMoneyModelResponse? walletAddMoneyModelResponse ,
    String? message,
    Status? statusWithdrawFromWallet,
    Status? statusDispoitFromWallet,
    WalletResponse? walletResponse,
  }) {
    return WalletState(
      message: message ?? this.message,
      statusGetWallet: statusGetWallet ?? this.statusGetWallet,
      statusWithdrawFromWallet:
          statusWithdrawFromWallet ?? this.statusWithdrawFromWallet,
      walletResponse: walletResponse ?? this.walletResponse,
      statusDispoitFromWallet: statusDispoitFromWallet?? this.statusDispoitFromWallet,
      walletAddMoneyModelResponse: walletAddMoneyModelResponse ?? this.walletAddMoneyModelResponse
    );
  }
}
