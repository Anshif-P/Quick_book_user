part of 'coupon_bloc.dart';

abstract class CouponEvent {}

class GetRoomCouponsEvent extends CouponEvent {
  String token;
  String vendorId;
  GetRoomCouponsEvent({required this.vendorId, required this.token});
}

class ApplyCouponEvent extends CouponEvent {
  final String couponCode;
  final String vendorId;

  ApplyCouponEvent(this.couponCode, this.vendorId);
}
