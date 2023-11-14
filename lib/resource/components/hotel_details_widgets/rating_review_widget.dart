import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';

import 'reviews_widget.dart';
import 'stars_widget.dart';

class RatingAndReviewWidget extends StatelessWidget {
  const RatingAndReviewWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    //  color: Colors.red,

                    child: Column(children: [
                      StartsWidget(
                          height: 45,
                          ratingList: [true, true, true, false, false]),
                    ]),
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                      alignment: Alignment.bottomRight,
                      height: 80,
                      // color: Colors.green,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                          ),
                          CustomTextWidget(
                            color: CustomColors.blackColor,
                            fontSize: 31,
                            fontWeight: FontWeight.w600,
                            text: '4.0',
                          ),
                          CustomTextWidget(
                            color: CustomColors.blackColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            text: '280 ratings',
                          ),
                        ],
                      ))),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Container(
            height: 0.2,
            color: CustomColors.blackColor,
          ),
          SizedBox(
            height: 15,
          ),
          Expanded(
              child: Container(
            //   color: Colors.yellow,
            width: double.maxFinite,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReviewWidget(),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
