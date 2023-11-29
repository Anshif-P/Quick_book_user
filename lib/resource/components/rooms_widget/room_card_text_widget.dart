import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';

class RoomCardTextWidget extends StatelessWidget {
  final String text;
  final bool colorSizeCheck;
  const RoomCardTextWidget(
      {super.key, required this.text, this.colorSizeCheck = false});

  @override
  Widget build(BuildContext context) {
    String formattedText = text.length >= 35
        ? '${text.substring(0, 35)}\n${text.substring(35)}'
        : text;
    return Text(
      formattedText,
      style: GoogleFonts.inter(
          textStyle: TextStyle(
        color: colorSizeCheck
            ? CustomColors.lightGreyColor
            : CustomColors.blackColor,
        fontSize: colorSizeCheck ? 10 : 13,
      )),
      overflow: TextOverflow.ellipsis,
    );
  }
}
