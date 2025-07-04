part of 'patiant_bloc.dart';

@immutable
sealed class PatiantEvent {}

class CreatePatientEvent extends PatiantEvent {
  final String firstName;
  final String lastName;
  final String information;
  final String phone;
  final String address;
  final String sex;
  final String blood;
  final String birthDay;
  final String photoPath;

  CreatePatientEvent({
    required this.firstName,
    required this.lastName,
    required this.information,
    required this.phone,
    required this.address,
    required this.sex,
    required this.blood,
    required this.birthDay,
    required this.photoPath,
  });
}
class GetProfilePataintEvent extends  PatiantEvent {}

