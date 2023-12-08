import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';

class FilterWidget extends StatelessWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      decoration: BoxDecoration(
          color: CustomColors.mainColor,
          borderRadius: BorderRadius.circular(7)),
      child: const Icon(
        Icons.tune,
        color: Colors.white,
      ),
    );
  }
}
