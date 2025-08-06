import 'package:doctor_booking1/features/wallet/presentation/manager/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../medical_history/presentation/manager/medical_history_bloc.dart';
import 'add_money_screen.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (

          ){
        Navigator.push(context, MaterialPageRoute(builder: (context) {
        return  AddBankAccountPage();
        },));
      }),
      appBar: AppBar(title: const Text('الرصيد')),
      body: BlocBuilder<WalletBloc, WalletState>(
        builder: (context, state) {
          if (state == Status.loading || state.walletResponse==null ) {
            return const Center(child: CircularProgressIndicator());
          } else if (state == Status.failed) {
            return Center(child: Text('خطأ: ${state.message}'));
          } else {
            final data = state.walletResponse!.doc[0];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'تفاصيل الرصيد',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('الرصيد:', style: TextStyle(fontSize: 18)),
                          Text('${data.balance} ل.س',
                              style: const TextStyle(fontSize: 18)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('تاريخ الإنشاء:',
                              style: TextStyle(fontSize: 16)),
                          Text(data.createdAt.toString(),
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('آخر تعديل:',
                              style: TextStyle(fontSize: 16)),
                          Text(data.updatedAt.toString(),
                              style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
