class DoctorModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String photo;
  final int expertise;
  final int duration;
  final String departmentName;

  DoctorModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.photo,
    required this.expertise,
    required this.duration,
    required this.departmentName,
  });

  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    final dept = json['department'] ?? {};
    return DoctorModel(
      id: json['_id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      email: json['email'],
      phone: json['phone'],
      photo: json['photo'],
      expertise: json['expertise'],
      duration: json['duration'],
      departmentName: dept['name'] ?? '',
    );
  }
}
