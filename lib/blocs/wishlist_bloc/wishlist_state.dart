part of 'wishlist_bloc.dart';

abstract class WishlistState {}

final class WishlistInitial extends WishlistState {}

abstract class WishlistActionState extends WishlistState {}

class FetchWishlistSuccessState extends WishlistState {
  List<WishlistModel> wishlist = [];
  FetchWishlistSuccessState({required this.wishlist});
}

class FetchWishlistErrorState extends WishlistState {
  String errorMessage;
  FetchWishlistErrorState({required this.errorMessage});
}

class FetchWishlistLoadingState extends WishlistState {}
