import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/model/wishlist_model.dart';
import 'package:hotel_booking_user_app/repositories/room_repo.dart';
part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<GetWishlistRoomsEvent>(getRoomWishlist);
    on<AddWishlistEvent>(addWishlistEvent);
    on<RemoveWishlistRoom>(removeWishlistRoom);
  }
  List<WishlistModel> wishlist = [];
  String? token;
  FutureOr<void> getRoomWishlist(
      GetWishlistRoomsEvent event, Emitter<WishlistState> emit) async {
    token = event.token;
    emit(FetchWishlistLoadingState());
    final either = await RoomRepositories().getWishlist(event.userId, token!);
    either.fold(
        (error) => emit(FetchWishlistErrorState(errorMessage: error.message)),
        (response) {
      if (response.runtimeType == List) {
        final List wishlistTemp = response;
        wishlist = wishlistTemp.map((e) => WishlistModel.fromJson(e)).toList();

        emit(FetchWishlistSuccessState(wishlist: wishlist));
      } else {
        emit(FetchWishlistErrorState(errorMessage: response['message']));
      }
    });
  }

  FutureOr<void> addWishlistEvent(
      AddWishlistEvent event, Emitter<WishlistState> emit) async {
    Map map = {'roomId': event.roomId, 'vendorId': event.vendorId};
    final either = await RoomRepositories().addWishlist(map, token);
    either.fold(
        (error) => emit(FetchWishlistErrorState(errorMessage: error.message)),
        (response) {
      if (response['status'] != 'failed') {
        wishlist.add(WishlistModel.fromJson(response['wishList']));

        emit(FetchWishlistSuccessState(wishlist: wishlist));
      } else {
        emit(FetchWishlistErrorState(errorMessage: response['message']));
      }
    });
  }

  FutureOr<void> removeWishlistRoom(
      RemoveWishlistRoom event, Emitter<WishlistState> emit) async {
    final either = await RoomRepositories().removeFromWishlist(event.roomId);
    either.fold(
        (error) => emit(FetchWishlistErrorState(errorMessage: error.message)),
        (response) {
      if (response['status'] != 'failed') {
        wishlist.removeWhere((element) => element.roomId.id == event.roomId);

        emit(FetchWishlistSuccessState(wishlist: wishlist));
      } else {
        FetchWishlistErrorState(errorMessage: response['message']);
      }
    });
  }
}
