part of 'wishlist_bloc.dart';

abstract class WishlistEvent {}

class GetWishlistRoomsEvent extends WishlistEvent {
  String userId;
  String token;
  GetWishlistRoomsEvent({required this.token, required this.userId});
}

class AddWishlistEvent extends WishlistEvent {
  String roomId;
  String vendorId;
  AddWishlistEvent({required this.roomId, required this.vendorId});
}

class RemoveWishlistRoom extends WishlistEvent {
  String roomId;
  RemoveWishlistRoom({required this.roomId});
}
