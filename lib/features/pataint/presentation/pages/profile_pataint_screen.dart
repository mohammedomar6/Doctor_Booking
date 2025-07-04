import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/patiant_bloc.dart';
class PatientProfileScreen extends StatefulWidget {
  const PatientProfileScreen({super.key});

  @override
  State<PatientProfileScreen> createState() => _PatientProfileScreenState();
}

class _PatientProfileScreenState extends State<PatientProfileScreen> {
  @override
  void initState() {
   context.read<PatiantBloc>().add(GetProfilePataintEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal.shade50,
      appBar: AppBar(
        title: const Text('ملف المريض'),
        backgroundColor: Colors.teal,
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<PatiantBloc, PatiantState>(
        builder: (context, state) {
          if (state ==Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }  else if (state ==Status.failed) {
            return Center(child: Text('حدث خطأ: ${state.massage}'));
          }  else{
            final  patient= state.profileResponse!.doc[0];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                elevation: 8,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: FileImage(File(patient.photo)),
                          onBackgroundImageError: (_, __) =>
                          const Icon(Icons.person, size: 50),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          '${patient.firstName} ${patient.lastName}',
                          style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.teal),
                        ),
                        const SizedBox(height: 10),
                        _buildInfoRow('الجنس', patient.sex),
                        _buildInfoRow('تاريخ الميلاد', patient.birthDay.toLocal().toString().split(' ')[0]),
                        _buildInfoRow('فصيلة الدم', patient.blood),
                        _buildInfoRow('رقم الهاتف', patient.phone),
                        _buildInfoRow('العنوان', patient.adderss),
                    //    _buildInfoRow('التأمين الصحي', patient.insurance!),
                        const Divider(height: 30, thickness: 1),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text('معلومات إضافية:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          patient.information,
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _buildInfoRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(Icons.info_outline, color: Colors.teal.shade300, size: 20),
          const SizedBox(width: 8),
          Text('$title: ', style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}
