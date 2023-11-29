part of 'coupon_bloc.dart';

abstract class CouponState {}

abstract class CouponActionState extends CouponState {}

final class CouponInitial extends CouponState {}

class CouponFetchErrorState extends CouponState {
  String errorMessage;
  CouponFetchErrorState({required this.errorMessage});
}

class CouponFetchLoadingState extends CouponState {}

class CouponFetchSuccessState extends CouponState {
  List<CouponModel> couponObjList = [];
  CouponFetchSuccessState({required this.couponObjList});
}

class CouponApplyFaliurState extends CouponActionState {
  final String errorMessage;

  CouponApplyFaliurState(this.errorMessage);
}

class CouponApplySuccessState extends CouponActionState {}

class CouponApplyLoadinState extends CouponActionState {}
