import 'package:doctor_booking1/core/app_validator.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:doctor_booking1/features/pataint/presentation/manager/patiant_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart'; // تأكد من الاستيراد بالأعلى

class CreatePatientScreen extends StatefulWidget {
  const CreatePatientScreen({Key? key}) : super(key: key);

  @override
  State<CreatePatientScreen> createState() => _CreatePatientScreenState();
}

class _CreatePatientScreenState extends State<CreatePatientScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController infoController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController birthDayController = TextEditingController();

  String? selectedSex;
  String? selectedBlood;
  String? imagePath;
  DateTime? selectedDate;

  final ImagePicker picker = ImagePicker();

  final List<String> sexOptions = ['mail', 'Femail'];
  final List<String> bloodOptions = [
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-',
    'O+',
    'O-'
  ];

  String getFormattedDate() {
    if (selectedDate == null) return "Select Birth Date";
    return DateFormat('yyyy-MM-dd').format(selectedDate!);
  }

  Future pickDate() async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: now.subtract(const Duration(days: 365 * 20)),
      // افتراض عمر 20 سنة
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        imagePath = picked.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatiantBloc, PatiantState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Succssefully')));
          Navigator.pushReplacementNamed(context, '/home');
        }
        if (state.status == Status.failed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Faild')));
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(title: const Text("Complete Your Info")),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                CustomTextField(
                  controller: firstNameController,
                  validator: (value) => AppValidator.required(value),
                  label: 'First Name',
                  hint: 'Enter name',
                  icon: Icons.person,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: lastNameController,
                  label: 'Last Name',
                  hint: 'Enter last name',
                  icon: Icons.person,
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  controller: infoController,
                  label: "Medical Information",
                  hint: 'Enter  Medical Information',
                  icon: Icons.info,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: phoneController,
                  label: "Phone",
                  icon: Icons.phone,
                  hint: 'enter  number phone',
                  keybordtype: TextInputType.phone,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  controller: addressController,
                  label: "Address",
                  icon: Icons.location_on,
                  hint: 'Enter Address',
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: "Sex"),
                  items: sexOptions.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                  value: selectedSex,
                  onChanged: (val) {
                    setState(() {
                      selectedSex = val;
                    });
                  },
                ),
                const SizedBox(height: 15),
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: "Blood Type"),
                  items: bloodOptions.map((e) {
                    return DropdownMenuItem(value: e, child: Text(e));
                  }).toList(),
                  value: selectedBlood,
                  onChanged: (val) {
                    setState(() {
                      selectedBlood = val;
                    });
                  },
                ),
                const SizedBox(height: 15),
                ListTile(
                  title: Text(getFormattedDate()),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: pickDate,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed: pickImage,
                      icon: const Icon(Icons.image),
                      label: const Text("Pick Image"),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        imagePath ?? "No Image Selected",
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    BlocProvider.of<PatiantBloc>(context).add(
                        CreatePatientEvent(
                            firstName: firstNameController.text,
                            lastName: lastNameController.text,
                            information: infoController.text,
                            phone: phoneController.text,
                            address: addressController.text,
                            sex: selectedSex!,
                            blood: selectedBlood!,
                            birthDay: selectedDate.toString(),
                            photoPath: imagePath!));
                  },
                  child: const Text("Submit"),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
