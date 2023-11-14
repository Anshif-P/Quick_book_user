import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/custom_colors.dart';

class AmountText extends StatelessWidget {
  const AmountText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      ' ₹$text',
      style: GoogleFonts.inter(
          textStyle: TextStyle(
        fontWeight: FontWeight.w600,
        color: CustomColors.greenColor,
        fontSize: 14,
      )),
    );
  }
}
