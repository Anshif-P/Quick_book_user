import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/model/rating_review_model.dart';
import '../../repositories/room_repo.dart';
part 'review_event.dart';
part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(ReviewInitial()) {
    on<AddRoomReviewEvent>(addRoomReviewEvent);
    on<GetRoomReviews>(getRoomReviews);
  }
  List<ReviewModel> list = [];

  FutureOr<void> addRoomReviewEvent(
      AddRoomReviewEvent event, Emitter<ReviewState> emit) async {
    emit(ReviewAddLoadingState());
    final either =
        await RoomRepositories().addRoomReview(event.map, event.token);
    either.fold(
        (error) => emit(ReviewAddedErrorState(erroMessage: error.message)),
        (response) {
      if (response['status'] != 'false') {
        emit(ReviewAddedSuccessState());
      } else {
        emit(ReviewAddedErrorState(erroMessage: response['message']));
      }
    });
  }

  FutureOr<void> getRoomReviews(
      GetRoomReviews event, Emitter<ReviewState> emit) async {
    emit(ReviewFetchLoadingState());
    final either =
        await RoomRepositories().getReviewRating(event.token, event.roomId);
    either.fold(
        (error) => emit(ReviewFetchErrorState(errorMessage: error.message)),
        (response) {
      if (response['status'] != 'failed') {
        final List reviews = response['review'];
        list = reviews.map((e) => ReviewModel.fromJson(e)).toList();
        emit(ReviewFetchSuccessState(reviewObjList: list));
      } else {
        emit(ReviewFetchErrorState(errorMessage: response['message']));
      }
    });
  }
}
