import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/medical_history_response.dart';
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

          if (state.status == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state.status == Status.failed) {
            return Center(child: Text(state.massage ?? "Error loading data"));
          }

          if (state.status == Status.success && state.medicalHistoryResponse?.doc != null) {
            final docs = state.medicalHistoryResponse!.doc!;

            if (docs.isEmpty) {
              return const Center(child: Text("No medical history found"));
            }

            return ListView.builder(
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
                        Text("Doctor: ${item.doctor?.firstName ?? ""} ${item.doctor?.lastName ?? ""}", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 8),
                        Text("Department: ${item.department ?? ""}"),
                        Text("Date: ${formatDate(item.dateId?.date.toString()?? "")}"),
                        const Divider(height: 20),
                        Text("Symptoms: ${item.symptoms}", style: const TextStyle(fontWeight: FontWeight.w500)),
                        Text("Diagnosis: ${item.diagnosis}", style: const TextStyle(fontWeight: FontWeight.w500)),
                        const SizedBox(height: 10),
                        if (item.recipe != null && item.recipe!.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text("Prescriptions:", style: TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 6),
                              ...item.recipe!.map((e) => Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: Text("- ${e.name} (${e.count} pcs) - ${e.details}"),
                              )),
                            ],
                          ),
                      ],
                    ),
                  ),
                );
              },
            );
          }

          return const Center(child: Text("Start fetching medical history"));
        },
      ),
    );
  }
}
