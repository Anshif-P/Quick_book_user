import 'package:hotel_booking_user_app/data/network/api_services.dart';
import 'package:hotel_booking_user_app/utils/type_def.dart';
import '../resource/app_urls/urls.dart';

class AuthenticationRepo {
  EitherResponse signUpUser(Map map) async =>
      await ApiService.postApi(Urls.singupUrl, map);
  EitherResponse conformSignUp(Map map) async =>
      await ApiService.postApi(Urls.confirmSignupUrl, map);
  EitherResponse loginUser(Map map) async =>
      await ApiService.postApi(Urls.loginUrl, map);
  EitherResponse getUserProfile(String token) async =>
      await ApiService.getApi(Urls.getUserDetailsUrl, token);
}
