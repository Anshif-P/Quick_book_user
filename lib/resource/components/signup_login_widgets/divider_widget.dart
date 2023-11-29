import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          color: CustomColors.lightGreyColor,
          height: 1,
        )),
        const SizedBox(
          width: 5,
        ),
        const Text(
          'Or',
          style: TextStyle(
              color: Color(0xFFA19B9B),
              fontWeight: FontWeight.bold,
              fontSize: 13),
        ),
        const SizedBox(
          width: 5,
        ),
        Expanded(
          child: Container(
            color: CustomColors.lightGreyColor,
            height: 1,
          ),
        ),
        // Divider(
        //   color: Color(0xFFDADADA),
        //   height: 25,
        //   thickness: 1,
        //   indent: 5,
        //   endIndent: 5,
        // ),
      ],
    );
  }
}
