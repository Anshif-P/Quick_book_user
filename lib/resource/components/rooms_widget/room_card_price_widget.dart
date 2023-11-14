import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/const/custom_colors.dart';

class RoomCardPriceWidget extends StatelessWidget {
  final String text;
  const RoomCardPriceWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        width: 55,
        height: 25,
        decoration: BoxDecoration(
            color: CustomColors.lightGreen,
            borderRadius: BorderRadius.circular(4)),
        child: Text(
          '₹$text',
          style: GoogleFonts.inter(
              textStyle: TextStyle(
            color: CustomColors.greenColor,
            fontSize: 14,
          )),
        ));
  }
}
