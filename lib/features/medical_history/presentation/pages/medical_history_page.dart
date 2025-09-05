
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_elevatedbutton.dart';
import 'package:doctor_booking1/features/medical_history/presentation/pages/additionall_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../manager/medical_history_bloc.dart';


class MedicalHistoryScreen extends StatefulWidget {
  const MedicalHistoryScreen({Key? key}) : super(key: key);

  @override
  State<MedicalHistoryScreen> createState() => _MedicalHistoryScreenState();
}

class _MedicalHistoryScreenState extends State<MedicalHistoryScreen> {
  String formatDate(String date) {
    return date.substring(0, 10); // بس التاريخ بدون الوقت
  }
  @override
  void initState() {
    super.initState();
    // ارسال الحدث عند فتح الشاشة
    context.read<MedicalHistoryBloc>().add(GetMedicalHistoryEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Medical History")),
      body: BlocBuilder<MedicalHistoryBloc, MedicalHistoryState>(
        builder: (context, state) {

          if (state.status == Status.loading || state.medicalHistoryResponse==null) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == Status.failed) {
            return Center(child: Text(state.massage ?? "Error loading data"));
          }

          if (state.status == Status.success && state.medicalHistoryResponse?.doc != null) {
            final docs = state.medicalHistoryResponse!.doc;

            if (docs.isEmpty) {
              return const Center(child: Text("No medical history found"));
            }

            return Column(
              children: [
                Image.asset('assets/images/img_1.png',fit: BoxFit.cover,),
                                ListView.builder(
                  padding: const EdgeInsets.all(12),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final item = docs[index];
                    return Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Doctor: ${item.doctor.firstName ?? ""} ${item.doctor.lastName ?? ""}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                            const SizedBox(height: 8),
                            Text("Department: ${item.department ?? ""}"),
                            Text("Date: ${formatDate(item.dateId.date.toString()?? "")}"),
                            Text('Next Date: ${formatDate(item.dateId.nextDate.toString()?? "")}'),
                            const Divider(height: 20),
                            Text("Symptoms: ${item.symptoms}", style: const TextStyle(fontWeight: FontWeight.w500)),
                            Text("Diagnosis: ${item.diagnosis}", style: const TextStyle(fontWeight: FontWeight.w500)),
                            const SizedBox(height: 10),
                            if (item.recipe != null && item.recipe.isNotEmpty)
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text("Prescriptions:", style: TextStyle(fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 6),
                                  ...item.recipe.map((e) => Padding(
                                    padding: const EdgeInsets.only(bottom: 4),
                                    child: Text("- ${e.name} (${e.count} pcs) - ${e.details}"),
                                  )),
                                ],
                              ),
                            CustomElevatedButton(onPressed: (){
                              context.read<MedicalHistoryBloc>().add(GetAllIdionallForUserEvent(recordId:item.id ));
                              Navigator.push(context, MaterialPageRoute(builder: (context) => AdditionalScreen(recordId: item.id,),));
                            }, width: 0.32,text: 'Additional',),

                          ],
                        ),
                      ),
                    );
                  },
                ),
              ],
            );
          }

          return const Center(child: Text("Start fetching medical history"));
        },
      ),
    );
  }
}
