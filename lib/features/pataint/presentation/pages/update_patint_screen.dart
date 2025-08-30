import 'package:doctor_booking1/core/app_validator.dart';
import 'package:doctor_booking1/features/auth/presentation/widgets/custom_text_field.dart';
import 'package:doctor_booking1/features/company/data/models/company_model.dart';
import 'package:doctor_booking1/features/pataint/data/models/pataint_response.dart';
import 'package:doctor_booking1/features/pataint/data/models/patiant_requast.dart';
import 'package:doctor_booking1/features/pataint/data/models/profile_response.dart';
import 'package:doctor_booking1/features/pataint/presentation/manager/patiant_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../company/presentation/manager/company_bloc.dart'; // تأكد من الاستيراد بالأعلى

class UpadatePatientScreen extends StatefulWidget {
  const UpadatePatientScreen({Key? key, required this.patiant})
      : super(key: key);
  final ProfileResponse patiant;

  @override
  State<UpadatePatientScreen> createState() => _UpadatePatientScreenState();
}

class _UpadatePatientScreenState extends State<UpadatePatientScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController infoController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  final TextEditingController birthDayController = TextEditingController();
  String? selectedInsurance;
  String? selectedSex;
  String? selectedBlood;
  String? imagePath;
  DateTime? selectedDate;
  String? imagePathInsurance;
  Information? information;

  ImagePicker picker = ImagePicker();

  final List<String> sexOptions = ['mail', 'femail'];
  final List<String> bloodOptions = [
    'O+',
    'O-',
    'A+',
    'A-',
    'B+',
    'B-',
    'AB+',
    'AB-'
  ];

  String getFormattedDate() {
    if (selectedDate == null) return "Select Birth Date";
    return DateFormat('yyyy-MM-dd').format(selectedDate!);
  }

  Future pickDate() async {
    final now = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: now,
    );

    if (picked != null) {
      setState(() {
        selectedDate =widget.patiant.doc[0].birthDay;
        selectedDate = picked;
      });
    }
  }

  Future<void> pickImage() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        imagePath = widget.patiant.doc[0].photo;
        imagePath = picked.path;
      });
    }
  }

  Future<void> pickImageIns() async {
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        imagePathInsurance = picked.path;
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
context.read<CompanyBloc>().add(GetAllCompanyEvent());
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PatiantBloc, PatiantState>(
      listener: (context, state) {
        if (state.status == Status.success) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Succssefully')));
          Navigator.pushReplacementNamed(context, '/patient_profile_screen');
        }
        if (state.status == Status.failed) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('Faild')));
        }
      },
      builder: (context, state) {
        firstNameController.text = widget.patiant.doc[0].firstName;
        lastNameController.text = widget.patiant.doc[0].lastName;
        birthDayController.text =
            widget.patiant.doc[0].birthDay.toLocal().toString();
        addressController.text = widget.patiant.doc[0].adderss;
        phoneController.text = widget.patiant.doc[0].phone;
     //  selectedBlood = widget.patiant.doc[0].blood;
        information = widget.patiant.doc[0].information;
    //  selectedInsurance = widget.patiant.doc[0].insurance;
   //   selectedDate =widget.patiant.doc[0].birthDay;
  //    imagePath = widget.patiant.doc[0].photo;

   selectedSex =widget.patiant.doc[0].sex;
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
                  onTap: () {
                    showInformationDialog(context);
                  },
                  label: "Medical Information",
                  hint: 'Enter  Medical Information',
                  icon: Icons.info,
                  readOnly: true,
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
                BlocBuilder<CompanyBloc, CompanyState>(
                  builder: (context, state) {
                    if (state.status == Status.failed) {
                      return Center(child: Text('no'),);
                    }
                    if (state.status == Status.success &&
                        state.companyModel == null) {
                      return Text('no data');
                    }
                    return DropdownButtonFormField<String>(
                      decoration: const InputDecoration(labelText: "insurance"),
                      items: state.companyModel == null ? [] : state
                          .companyModel!.doc?.map((e) {
                        return DropdownMenuItem(
                            value: e.name, child: Text(e.name));
                      }).toList(),
                      value: selectedInsurance,
                      onChanged: (val) {
                        setState(() {
                          selectedInsurance = widget.patiant.doc[0].insurance;
                          selectedInsurance = val;
                        });
                      },
                    );
                  },
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
                      selectedSex =widget.patiant.doc[0].sex;
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
                      selectedBlood=widget.patiant.doc[0].blood;
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
                      onPressed: () => pickImage(),
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
                /*   Row(
                  children: [
                    ElevatedButton.icon(
                      onPressed:  ()=> pickImageIns(),
                      icon: const Icon(Icons.image),
                      label: const Text("Pick Image"),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        imagePathInsurance ?? "No Image Selected",
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),*/
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    print(information!.allergyHistory);
                    PataintRequast p = PataintRequast(   firstName: firstNameController.text,
                        lastName: lastNameController.text,
                        information: information!,
                        phone: phoneController.text,
                        adderss: addressController.text,
                        sex: selectedSex!,
                        blood: selectedBlood!,
                        insurance: selectedInsurance,
                        birthDay: selectedDate.toString(),
                        photo: imagePath!);
                    BlocProvider.of<PatiantBloc>(context).add(
                        UpdatePatientEvent(
                          pataintRequast:p,
                        ));
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

  showInformationDialog(BuildContext context) async {
    // Controllers لكل TextField
    final medicalController = TextEditingController(text:  widget.patiant.doc[0].information.medicalHistory);
    final surgicalController = TextEditingController(text: widget.patiant.doc[0].information.surgicalHistory);
    final allergyController = TextEditingController(text: widget.patiant.doc[0].information.allergyHistory);

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16)),
          title: Text("Enter Medical Information"),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: medicalController,
                  decoration: InputDecoration(
                    labelText: "Medical History",
                    prefixIcon: Icon(Icons.healing),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: surgicalController,
                  decoration: InputDecoration(
                    labelText: "Surgical History",
                    prefixIcon: Icon(Icons.local_hospital),
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: allergyController,
                  decoration: InputDecoration(
                    labelText: "Allergy History",
                    prefixIcon: Icon(Icons.warning),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context), // إلغاء
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                // أنشئ object من Information
                final info = Information(
                  medicalHistory: medicalController.text,
                  surgicalHistory: surgicalController.text,
                  allergyHistory: allergyController.text,
                );
                information = info; // رجع المعلومات للفانكشن المستدعي
                if (information != null)
                  Navigator.pop(context);
              },
              child: Text("Save"),
            ),
          ],
        );
      },
    );
  }

}
