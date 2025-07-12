part of 'wallet_bloc.dart';

class WalletEvent {}

class GetWalletEvent extends WalletEvent {}

class WithdrawFromWalletEvent extends WalletEvent {
  final int amount;

  WithdrawFromWalletEvent(this.amount);
}
