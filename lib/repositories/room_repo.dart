import 'package:hotel_booking_user_app/data/network/api_services.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/resource/app_urls/urls.dart';
import 'package:hotel_booking_user_app/utils/type_def.dart';

class RoomRepositories {
  final token = SharedPrefModel.instance.getData('token');

  EitherResponse getAllRoom() async =>
      await ApiService.getApi(Urls.getAllRoomUrl);

  EitherResponse getAllBookedRoomDates(String roomId) async =>
      await ApiService.getApi('${Urls.getRoomBookingDateUrl}$roomId');

  EitherResponse conformBookRoom(Map map, String token) async =>
      await ApiService.postApi(Urls.conformRoomBook, map, token);

  EitherResponse getBookedRooms(String token) async =>
      await ApiService.getApi(Urls.getUserBookedRoom, token);

  EitherResponse addRoomReview(Map map, String token) async =>
      await ApiService.postApi(Urls.addRoomReview, map, token);

  EitherResponse getReviewRating(String token, String roomId) async =>
      await ApiService.getApi('${Urls.getReviewRating}$roomId', token);

  EitherResponse cancelBooking(Map map) async =>
      await ApiService.postApi(Urls.cancelBooking, map);

  EitherResponse getWishlist(String userId, String token) async =>
      await ApiService.getApi(Urls.getWishlist + userId, token);

  EitherResponse addWishlist(Map map, token) async =>
      await ApiService.postApi(Urls.addWishlist, map, token);

  EitherResponse removeFromWishlist(String roomId) async =>
      await ApiService.deleteApi(Urls.removeFromWishlist + roomId, token!);

  EitherResponse getRoomCoupons(String vendorId, token) async =>
      await ApiService.getApi(Urls.getRoomCoupons + vendorId, token);

  EitherResponse applyCoupons(Map map, token) async =>
      await ApiService.postApi(Urls.applyCoupon, map, token);

  EitherResponse editUserDetails(Map map, token) async =>
      await ApiService.patch(Urls.editProfile, map, token);

  EitherResponse changePassword(Map map, token) async =>
      await ApiService.patch(Urls.changePassword, map, token);
}
