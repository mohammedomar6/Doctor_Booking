part of 'review_bloc.dart';

@immutable
sealed class ReviewEvent {}
class AddReviewEvent extends ReviewEvent{
  final ReviewRequestModel reviewRequestModel ;

  AddReviewEvent({required this.reviewRequestModel});
}