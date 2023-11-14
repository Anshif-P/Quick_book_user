import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardsHeadingTextWidget extends StatelessWidget {
  final String text;
  const CardsHeadingTextWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: GoogleFonts.inter(
            textStyle: const TextStyle(
          overflow: TextOverflow.ellipsis,
          color: Colors.black,
          fontWeight: FontWeight.w600,
          fontSize: 19,
        )));
  }
}
