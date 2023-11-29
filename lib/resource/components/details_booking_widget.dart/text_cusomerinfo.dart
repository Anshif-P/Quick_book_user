import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../const/custom_colors.dart';

class CusomerInfoTextWidget extends StatelessWidget {
  final String text1;
  final String text2;
  final bool colorCheck;

  const CusomerInfoTextWidget(
      {super.key,
      required this.text1,
      required this.text2,
      this.colorCheck = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          text1,
          style: GoogleFonts.inter(
              textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          )),
        ),
        Text(
          text2,
          style: GoogleFonts.inter(
              textStyle: TextStyle(
            color: colorCheck ? CustomColors.blueColor : Colors.black,
            fontSize: 14,
          )),
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
