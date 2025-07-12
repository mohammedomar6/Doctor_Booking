part of 'wallet_bloc.dart';

class WalletState {
  final Status statusGetWallet;
  final Status statusWithdrawFromWallet;
  final String? message;
  final WalletResponse? walletResponse;

  WalletState(
      {this.message,
      this.statusGetWallet = Status.initial,
      this.statusWithdrawFromWallet = Status.initial,
      this.walletResponse});

  WalletState copyWith({
    Status? statusGetWallet,
    String? message,
    Status? statusWithdrawFromWallet,
    WalletResponse? walletResponse,
  }) {
    return WalletState(
      message: message ?? this.message,
      statusGetWallet: statusGetWallet ?? this.statusGetWallet,
      statusWithdrawFromWallet:
          statusWithdrawFromWallet ?? this.statusWithdrawFromWallet,
      walletResponse: walletResponse ?? this.walletResponse,
    );
  }
}
