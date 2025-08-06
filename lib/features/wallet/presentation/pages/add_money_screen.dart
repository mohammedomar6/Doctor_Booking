import 'package:doctor_booking1/core/app_validator.dart';
import 'package:doctor_booking1/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:doctor_booking1/features/wallet/presentation/manager/wallet_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddBankAccountPage extends StatefulWidget {
  const AddBankAccountPage({Key? key}) : super(key: key);

  @override
  State<AddBankAccountPage> createState() => _AddBankAccountPageState();
}

class _AddBankAccountPageState extends State<AddBankAccountPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _cardController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  void _addFunds() {
    if (_formKey.currentState!.validate()) {
      final cardNumber = _cardController.text;
      final amount = _amountController.text;

      // وهميًا فقط - لا يتم حفظ البيانات
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("تمت إضافة \$${amount} بنجاح إلى حساب التطبيق"),
          backgroundColor: Colors.green,
        ),
      );

      // تفريغ الحقول
      _cardController.clear();
      _amountController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WalletBloc, WalletState>(
      listener: (context, state) {
       if(state.statusDispoitFromWallet==Status.success){
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message.toString())));
         context.read<WalletBloc>().add(GetWalletEvent());

       }
       if(state.statusDispoitFromWallet==Status.failed){
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.message.toString())));
       }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text("إضافة حساب بنكي"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: _cardController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: "رقم البطاقة",
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.length < 12) {
                        return "يرجى إدخال رقم بطاقة صحيح (12 رقم على الأقل)";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  CustomTextField(controller: _amountController,label: 'Balance',hint:'Enter Balance',icon: Icons.money_off,validator:(value) =>  AppValidator.required(value),),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () {
                      context.read<WalletBloc>().add(
                          DispoitFromWalletEvent(amount: int.parse(
                              _amountController.text)));
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('add money succssesful ') ,));
                      context.read<WalletBloc>().add(
                         GetWalletEvent());
                      Navigator.pop(context);
                    },
                    child: Text("Add Balance"),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
