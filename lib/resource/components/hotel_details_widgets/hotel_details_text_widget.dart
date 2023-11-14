import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../const/custom_colors.dart';

class HotelDetailsTextWidget extends StatelessWidget {
  final String text;
  final bool sizeCheck;
  final bool colorCheck;
  const HotelDetailsTextWidget(
      {super.key,
      required this.text,
      this.sizeCheck = false,
      this.colorCheck = false});

  @override
  Widget build(BuildContext context) {
    // String formatedText = text.length > 70
    //     ? '${text.substring(0, 70)} \n ${text.substring(70)}'
    //     : text;
    return Text(
      text,
      //overflow: TextOverflow.ellipsis,
      style: GoogleFonts.inter(
          textStyle: TextStyle(
        color: colorCheck ? CustomColors.lightGreyColor : Colors.black,
        fontSize: sizeCheck ? 20 : 14,
      )),
    );
  }
}
