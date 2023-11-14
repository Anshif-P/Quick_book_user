import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/const/custom_colors.dart';

class PriceTextWidget extends StatelessWidget {
  final String text;
  final bool paddingCheck;
  const PriceTextWidget(
      {super.key, required this.text, this.paddingCheck = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: paddingCheck
          ? const EdgeInsets.only(left: 20)
          : const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Price',
            style: GoogleFonts.inter(
                textStyle: TextStyle(
              color: CustomColors.grey,
              fontSize: 14,
            )),
          ),
          SizedBox(
            height: 5,
          ),
          Row(
            children: [
              Text(
                '₹$text',
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 19,
                )),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                'Best',
                style: GoogleFonts.inter(
                    textStyle: TextStyle(
                  color: CustomColors.grey,
                  fontSize: 14,
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
