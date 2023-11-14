import 'dart:convert';
import 'dart:io';
import 'package:either_dart/either.dart';
import 'package:hotel_booking_user_app/utils/app_exception.dart';
import 'package:hotel_booking_user_app/utils/type_def.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static Map<String, String>? _header = {
    'Content-Type': 'application/json',
    'usertoken': ''
  };

  static EitherResponse postApi(String url, Map map,
      [String? userToken]) async {
    final uri = Uri.parse(url);
    if (userToken != null) {
      _header!['usertoken'] = userToken;
    }
    final body = jsonEncode(map);
    dynamic fetchedData;
    try {
      final response = await http.post(uri, body: body, headers: _header);
      print('hai--------------------------response body');
      print(response.body);
      fetchedData = _getResponse(response);

      return Right(fetchedData);
    } on SocketException {
      return Left(InternetException());
    } on http.ClientException {
      return Left(RequestTimeOutException());
    } catch (e) {
      return Left(BadRequestException());
    }
  }

  static EitherResponse getApi(String url, [String? token]) async {
    print(url);
    final uri = Uri.parse(url);
    if (token != null) {
      _header!['usertoken'] = token;
    }
    try {
      dynamic fetchedData;
      print('befor api call');
      final response = await http.get(uri, headers: _header);
      fetchedData = _getResponse(response);
      print('=================================new fetched data');
      print(fetchedData);
      return Right(fetchedData);
    } on SocketException {
      return Left(InternetException());
    } on http.ClientException {
      return Left(RequestTimeOutException());
    } catch (e) {
      return Left(BadRequestException());
    }
  }

  static _getResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return (jsonDecode(response.body));
      case 400:
        return throw BadRequestException();
      default:
        throw BadRequestException();
    }
  }
}
