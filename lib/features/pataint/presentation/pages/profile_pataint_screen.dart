import 'dart:io';

import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:doctor_booking1/features/pataint/presentation/pages/update_patint_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
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

      appBar: AppBar(
        title: const Text('Patiant File '),
        backgroundColor: MyColours.white,
        centerTitle: true,
        elevation: 0,
      ),
      body: BlocBuilder<PatiantBloc, PatiantState>(
        builder: (context, state) {
          if (state ==Status.loading || state.profileResponse==null) {
            return const Center(child: CircularProgressIndicator());
          }  else if (state ==Status.failed ) {
            return Center(child: Text('حدث خطأ: ${state.massage}'));
          }  else{
            final  patient= state.profileResponse!.doc[0];
            String fullPath = patient.photo;

            // استخراج اسم الملف مع المجلد الأخير
            String fileName = fullPath.split("cache/").last;
            return patient==null ? Text('no profile Founde'): Padding(
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
                              ),
                        ),
                        const SizedBox(height: 10),
                      _buildInfoRow('Sex', patient.sex),
                        _buildInfoRow('Birth Day', patient.birthDay.toLocal().toString().split(' ')[0]),
                        _buildInfoRow('Blood', patient.blood),
                        _buildInfoRow('Phone', patient.phone),
                        _buildInfoRow('Adderss', patient.adderss),
                        _buildInfoRow('Insurance',patient.insurance==null? 'no  insurance ': patient.insurance!),
                        const Divider(height: 30, thickness: 1),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text('More Informetion:',
                              style: TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'AllergyHistory: ${patient.information.allergyHistory}',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Medical History: ${patient.information.medicalHistory}',
                          textAlign: TextAlign.justify,
                          style: const TextStyle(fontSize: 16),
                        ),
                        Text(
                          'Surgical History: ${patient.information.surgicalHistory}',
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
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColours.blue, // لون حسب ما تحب
        child: const Icon(Icons.edit),
        onPressed: () {
          // هنا ممكن تفتح صفحة تعديل أو Dialog
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => UpadatePatientScreen(patiant: context.read<PatiantBloc>().state.profileResponse!),
            ),
          );
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
