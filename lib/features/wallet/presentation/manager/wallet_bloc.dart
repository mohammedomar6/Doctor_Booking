import 'package:bloc/bloc.dart';
import 'package:doctor_booking1/features/wallet/data/models/wallet_response.dart';
import 'package:doctor_booking1/features/wallet/data/repositories/wallet_repo.dart';
import 'package:meta/meta.dart';

part 'wallet_event.dart';
part 'wallet_state.dart';

class WalletBloc extends Bloc<WalletEvent, WalletState> {
  final WalletRepo walletRepo;
  WalletBloc({required this.walletRepo}) : super(WalletState()) {
    on<WalletEvent>((event, emit) {

    });
    on<GetWalletEvent>((event, emit) async{
      emit(state.copyWith(status: Status.loading));
       final res =await walletRepo.getWallet();
      res.fold((l) {
        emit(state.copyWith(status: Status.failed,massage: l),);
      }, (r) {
        emit(state.copyWith(status: Status.success,massage: r.status,walletResponse: r));
      },);
    },);
  }
}
