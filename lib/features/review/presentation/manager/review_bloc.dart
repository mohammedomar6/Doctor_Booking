import 'package:bloc/bloc.dart';
import 'package:doctor_booking1/features/medical_history/presentation/manager/medical_history_bloc.dart';
import 'package:doctor_booking1/features/review/data/models/review_request_model.dart';
import 'package:doctor_booking1/features/review/data/models/review_response_model.dart';
import 'package:doctor_booking1/features/review/data/repositories/review_repo.dart';
import 'package:meta/meta.dart';

part 'review_event.dart';

part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewRepo reviewRepo;

  ReviewBloc({required this.reviewRepo}) : super(ReviewState()) {
    on<ReviewEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddReviewEvent>(
      (event, emit) async {
        emit(state.copyWith(reviewStatus: Status.loading));
        try {
          final res = await reviewRepo.addReview(ReviewRequestModel(
              message: event.reviewRequestModel.message,
              rate: event.reviewRequestModel.rate));
          res.fold((l) => emit(state.copyWith(reviewStatus: Status.failed,massage: l)) , (r) => emit(state.copyWith(reviewStatus: Status.success,reponseModel: r)),);
        } on Exception catch (e) {
            emit(state.copyWith(reviewStatus: Status.failed,massage: e.toString()));
        }
      },
    );
  }
}
