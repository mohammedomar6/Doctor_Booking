import 'package:bloc/bloc.dart';
import 'package:doctor_booking1/features/wallet/data/models/wallet_add_money_model_response.dart';
import 'package:doctor_booking1/features/wallet/data/models/wallet_request.dart';
import 'package:doctor_booking1/features/wallet/data/models/wallet_response.dart';
import 'package:doctor_booking1/features/wallet/data/repositories/wallet_repo.dart';

import '../../../medical_history/presentation/manager/medical_history_bloc.dart';

part 'wallet_event.dart';

part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepo walletRepo;

  WalletBloc({required this.walletRepo}) : super(WalletState()) {
    on<WalletEvent>((event, emit) {});
    on<GetWalletEvent>(
      (event, emit) async {
        emit(state.copyWith(statusGetWallet: Status.loading));
        final res = await walletRepo.getWallet();
        res.fold(
          (l) {
            emit(
              state.copyWith(statusGetWallet: Status.failed, message: l),
            );
          },
          (r) {
            emit(state.copyWith(
                statusGetWallet: Status.success,
                message: r.status,
                walletResponse: r));
          },
        );
      },
    );
    on<WithdrawFromWalletEvent>(
          (event, emit) async {
        emit(state.copyWith(statusWithdrawFromWallet: Status.loading));
        final res = await walletRepo.getWallet();
        res.fold(
              (l) {
            emit(
              state.copyWith(statusWithdrawFromWallet: Status.failed, message: l),
            );
          },
              (r) {
            emit(state.copyWith(
                statusWithdrawFromWallet: Status.success,
                message: r.status,
                walletResponse: r));
          },
        );
      },
    );
    on<DispoitFromWalletEvent>(
          (event, emit) async {
        emit(state.copyWith(statusDispoitFromWallet: Status.loading));
        final res = await walletRepo.dispoitFromWalletRepo(WalletRequest(balance: event.amount));
        res.fold(
              (l) {
            emit(
              state.copyWith(statusDispoitFromWallet: Status.failed, message: l),
            );
          },
              (r) {
            emit(state.copyWith(
                statusDispoitFromWallet: Status.success,
                message: r.status,
                walletAddMoneyModelResponse: r));
          },
        );
      },
    );
  }
}
