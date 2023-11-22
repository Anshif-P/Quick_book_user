part of 'review_bloc.dart';

abstract class ReviewState {}

final class ReviewInitial extends ReviewState {}

abstract class ReviewActionState extends ReviewState {}

class ReviewAddedSuccessState extends ReviewState {}

class ReviewAddedErrorState extends ReviewState {
  String erroMessage;
  ReviewAddedErrorState({required this.erroMessage});
}

class ReviewAddLoadingState extends ReviewState {}

class ReviewFetchSuccessState extends ReviewActionState {
  List<ReviewModel> reviewObjList;
  ReviewFetchSuccessState({required this.reviewObjList});
}

class ReviewFetchErrorState extends ReviewActionState {
  String errorMessage;
  ReviewFetchErrorState({required this.errorMessage});
}

class ReviewFetchLoadingState extends ReviewActionState {}
