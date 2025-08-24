part of 'review_bloc.dart';

@immutable
 class ReviewState {
 final Status?    reviewStatus ;
 final ReviewReponseModel? reponseModel ;
 final String? massage ;

  ReviewState({ this.reviewStatus,  this.reponseModel,  this.massage});

 ReviewState copyWith({
   Status? reviewStatus,
   ReviewReponseModel? reponseModel,
   String? massage,
 }) {
   return ReviewState(
     reviewStatus: reviewStatus ?? this.reviewStatus,
     reponseModel: reponseModel ?? this.reponseModel,
     massage: massage ?? this.massage,
   );
 }
}


