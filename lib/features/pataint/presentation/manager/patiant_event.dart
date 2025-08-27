part of 'patiant_bloc.dart';

@immutable
sealed class PatiantEvent {}

class CreatePatientEvent extends PatiantEvent {
  final String firstName;
  final String lastName;
  final Information? information;
  final String phone;
  final String address;
  final String sex;
  final String blood;
  final String birthDay;
  final String photoPath;
  final String? insurance;
  final String? insurancePhoto;

  CreatePatientEvent(  {
     this.insurance,  this.insurancePhoto,
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
class UpdatePatientEvent extends PatiantEvent {
 final  PataintRequast pataintRequast ;

  UpdatePatientEvent({required this.pataintRequast});
}
class GetProfilePataintEvent extends  PatiantEvent {}


