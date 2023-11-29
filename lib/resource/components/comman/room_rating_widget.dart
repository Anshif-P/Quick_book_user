import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../const/custom_colors.dart';

class RatingRoomWidget extends StatelessWidget {
  final String text;
  const RatingRoomWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          Icons.star_rate_rounded,
          color: CustomColors.mainColor,
          size: 20,
        ),
        Text(
          '($text)',
          style: GoogleFonts.inter(
              textStyle: const TextStyle(
            color: Colors.black,
            fontSize: 15,
          )),
        )
      ],
    );
  }
}
