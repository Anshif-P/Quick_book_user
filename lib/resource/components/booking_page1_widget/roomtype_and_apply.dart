import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';

class CustomButtonForCouponApplyType extends StatelessWidget {
  final String text;
  final Color color;
  final VoidCallback onPressedFunction;
  const CustomButtonForCouponApplyType(
      {super.key,
      required this.text,
      required this.color,
      required this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(7)),
      child: ElevatedButton(
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all(color)),
          onPressed: onPressedFunction,
          child: CustomTextWidget(
              text: text,
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600)),
    );
  }
}
