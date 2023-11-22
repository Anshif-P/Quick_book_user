part of 'review_bloc.dart';

abstract class ReviewEvent {}

class AddRoomReviewEvent extends ReviewEvent {
  Map<String, dynamic> map = {};
  String token;
  AddRoomReviewEvent({required this.map, required this.token});
}

class GetRoomReviews extends ReviewEvent {
  String token;
  String roomId;
  GetRoomReviews({required this.roomId, required this.token});
}
