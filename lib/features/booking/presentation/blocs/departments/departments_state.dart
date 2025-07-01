part of 'departments_bloc.dart';

class DepartmentsState {
  final Status depStatusBook;
  final List<DepartmentModel> departmentListBook;

  DepartmentsState(
      {this.depStatusBook = Status.initial,
      this.departmentListBook = const []});

  DepartmentsState copyWith({
    Status? depStatusBook,
    List<DepartmentModel>? departmentListBook,
  }) {
    return DepartmentsState(
      depStatusBook: depStatusBook ?? this.depStatusBook,
      departmentListBook: departmentListBook ?? this.departmentListBook,
    );
  }
}
