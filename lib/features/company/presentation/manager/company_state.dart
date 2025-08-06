part of 'company_bloc.dart';





class CompanyState {
  final Status? status;

  final String? massage ;
  final  CompanyModel? companyModel;


  const CompanyState({

    this.status,
    this.companyModel,
    this.massage
  });

  CompanyState copyWith({
    Status? status,

    CompanyModel? companyModel,
    String? massage,
  }) {
    return CompanyState(
      status: status ?? this.status,
      companyModel: companyModel ?? this.companyModel,
      massage: massage ?? this.massage,
    );
  }
}


