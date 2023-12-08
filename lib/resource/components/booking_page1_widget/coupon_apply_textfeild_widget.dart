import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';

class CouponApplyTextFeild extends StatelessWidget {
  final TextEditingController controller;

  const CouponApplyTextFeild({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
            hintText: 'enter your coupon code',
            hintStyle: TextStyle(color: CustomColors.grey),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.lightGreyColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.lightGreyColor)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: CustomColors.lightGreyColor)),
            contentPadding: EdgeInsets.only(top: 10, left: 10)),
      ),
    );
  }
}
