import 'dart:io';
import 'package:doctor_booking1/features/medical_history/data/models/upload_additionl_file_model.dart';
import 'package:doctor_booking1/features/medical_history/data/models/additional_response_model.dart';
import 'package:doctor_booking1/features/medical_history/presentation/manager/medical_history_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';


class AdditionalScreen extends StatelessWidget {
  const AdditionalScreen({super.key, required this.recordId});
final String recordId ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("الإضافات الطبية")),
      body: BlocListener<MedicalHistoryBloc, MedicalHistoryState>(
        listenWhen: (previous, current) =>
        previous.uploadFile != current.uploadFile,
        listener: (context, state) {
          if (state.uploadFile == Status.success) {

            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("تمت إضافة الصورة بنجاح ✅")),
            );

            context.read<MedicalHistoryBloc>().add(GetAllIdionallForUserEvent(recordId:recordId));
          } else if (state.uploadFile == Status.failed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("فشل رفع الصورة: ${state.massage}")),
            );
          }
        },
        child: BlocBuilder<MedicalHistoryBloc, MedicalHistoryState>(
          builder: (context, state) {
            if (state.statusAddionll == Status.loading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state.statusAddionll == Status.success) {
              final docs = state.additionallResponseModel!.doc;

              return ListView.builder(
                itemCount: docs.length,
                itemBuilder: (context, index) {
                  final doc = docs[index];

                  return Card(
                    margin: const EdgeInsets.all(8),
                    child: ListTile(
                      title: Text(doc.name),
                      subtitle: Text("Type: ${doc.type}"),
                      trailing: _ImagePickerWidget(doc: doc),
                    ),
                  );
                },
              );
            } else if (state.statusAddionll == Status.failed) {
              return Center(child: Text(state.massage!));
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}


class _ImagePickerWidget extends StatelessWidget {
  final Doc doc;
  const _ImagePickerWidget({required this.doc});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.add_a_photo, color: Colors.blue),
      onPressed: () async {
        final picked =
        await ImagePicker().pickImage(source: ImageSource.gallery);
        if (picked != null) {
          context.read<MedicalHistoryBloc>().add(
            UploadFileEvent(
              recordId: doc.recourd,
              additionalId: doc.id,
              additionallFIleModel:
              UploadAdditionallFIleModel(file: picked.path),
            ),
          );
        }
      },
    );
  }
}
