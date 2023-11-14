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
  EitherResponse conformBookRoom(Map map, token) async =>
      await ApiService.postApi(Urls.conformRoomBook, map, token);
}
