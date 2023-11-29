import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/model/coupon_model.dart';
import 'package:hotel_booking_user_app/repositories/room_repo.dart';
part 'coupon_event.dart';
part 'coupon_state.dart';

class CouponBloc extends Bloc<CouponEvent, CouponState> {
  CouponBloc() : super(CouponInitial()) {
    on<GetRoomCouponsEvent>(getRoomCoupons);
    on<ApplyCouponEvent>(applyCouponEvent);
  }
  List<CouponModel>? couponObjListTemp;
  List<CouponModel>? couponObjList;
  final DateTime dateTime = DateTime.now();

  String? token;
  FutureOr<void> getRoomCoupons(
      GetRoomCouponsEvent event, Emitter<CouponState> emit) async {
    token = event.token;
    emit(CouponFetchLoadingState());
    final either =
        await RoomRepositories().getRoomCoupons(event.vendorId, event.token);
    either.fold(
        (error) => emit(CouponFetchErrorState(errorMessage: error.message)),
        (response) {
      if (response['status'] != 'failed') {
        final List copupons = response['coupon'];
        couponObjListTemp =
            copupons.map((e) => CouponModel.fromJson(e)).toList();
        couponObjList = couponObjListTemp!
            .where((element) => element.endDate.isAfter(dateTime))
            .toList();
        // copupons.map((e) {
        //   if (e['isExpire'] == true) {
        //     return CouponModel.fromJson(e);
        //   }
        //   return false;
        // }).toList();
        emit(CouponFetchSuccessState(couponObjList: couponObjList!));
      } else {
        emit(CouponFetchErrorState(errorMessage: response['message']));
      }
    });
  }

  FutureOr<void> applyCouponEvent(
      ApplyCouponEvent event, Emitter<CouponState> emit) async {
    emit(CouponApplyLoadinState());
    Map map = {
      'couponCode': event.couponCode.trim(),
      'vendorid': event.vendorId
    };
    final either = await RoomRepositories().applyCoupons(map, token);
    either.fold((error) => emit(CouponApplyFaliurState(error.message)),
        (response) {
      if (response['status'] != 'failed') {
        emit(CouponApplySuccessState());
        emit(CouponFetchSuccessState(couponObjList: couponObjList!));
      } else {
        emit(CouponApplyFaliurState(response['message']));
        emit(CouponFetchSuccessState(couponObjList: couponObjList!));
      }
    });
  }
}
