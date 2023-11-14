import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LocationTextWidget extends StatelessWidget {
  final String text1;
  final String text2;
  const LocationTextWidget(
      {super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.location_on,
          color: Color(0xFFCB102F),
          size: 15,
        ),
        Text(
          '$text1 , $text2',
          style: GoogleFonts.inter(
              textStyle: const TextStyle(
            color: Color(0xFFA19B9B),
            fontSize: 12,
          )),
        )
      ],
    );
  }
}
