import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/resource/components/hotel_details_widgets/stars_widget.dart';

import 'view_all_review_button.dart';

class ReviewWidget extends StatelessWidget {
  const ReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
            text: 'Anshif P',
            color: CustomColors.blackColor,
            fontSize: 9,
            fontWeight: FontWeight.w600),
        SizedBox(
          height: 2,
        ),
        Container(
          width: 40,
          //  color: Colors.blue,
          child: StartsWidget(
            height: 10,
            ratingList: [true, true, true, false, false],
            bottomTextCheck: false,
            sizeCheck: false,
          ),
        ),
        Text(
          'Nice room to stay,waater geyser is available.25 min root towards  bangalore.Best if you want to go a nice hotel in the state.... ',
          style: GoogleFonts.inter(
              textStyle: TextStyle(
                  color: CustomColors.blackColor,
                  fontSize: 9,
                  fontWeight: FontWeight.w300)),
        ),
        SizedBox(
          height: 8,
        ),
        CustomTextWidget(
            text: 'Nov 22,2023',
            color: CustomColors.grey,
            fontSize: 9,
            fontWeight: FontWeight.w300),
        SizedBox(
          height: 15,
        ),
        ViewAllButton(
          onpressFunction: () {},
        )
      ],
    );
  }
}
