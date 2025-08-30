import 'package:doctor_booking1/constant/my_colours.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../blocs/doctor_tabel/doctor_table_bloc.dart';

class DoctorScheduleTablePage extends StatefulWidget {
  @override
  State<DoctorScheduleTablePage> createState() => _DoctorScheduleTablePageState();
}

class _DoctorScheduleTablePageState extends State<DoctorScheduleTablePage> {
  @override
  void initState() {
    super.initState();
    context.read<DoctorTableBloc>().add(GetDoctorTable());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Doctors Schedule")),
      body: BlocBuilder<DoctorTableBloc, DoctorTableState>(
        builder: (context, state) {
          if (state.doctorTableStatus == Status.success) {
            final data = state.doctorTabelReponse!.data;

            return ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final department = data[index].department;
                final doctors = data[index].doctors;

                return Card(
                  margin: EdgeInsets.only(bottom: 12),
                  elevation: 2,
                  child: ExpansionTile(
                    collapsedIconColor: MyColours.black,
                    collapsedTextColor: MyColours.black,

                    title: Text(
                      department,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    children: [
                      if (doctors.isEmpty)
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("No doctors in this department"),
                        )
                      else
                        ...doctors.map((doctor) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                            child: Card(
                              color: MyColours.white,
                              surfaceTintColor: MyColours.blue,
                              elevation: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      " Dr ${doctor.firstName} ${doctor.lastName}",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueAccent,
                                      ),
                                    ),
                                    Divider(),
                                    ...doctor.schedule.map((s) => Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(s.day, style: TextStyle(fontWeight: FontWeight.w500)),
                                        Text("${s.first}:00 - ${s.last}:00"),
                                      ],
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                    ],
                  ),
                );
              },
            );
          } else if (state.doctorTableStatus == Status.failed) {
            return Center(child: Text(state.massage!));
          } else if (state.doctorTableStatus == Status.loading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return SizedBox();
          }
        },
      ),
    );
  }
}
