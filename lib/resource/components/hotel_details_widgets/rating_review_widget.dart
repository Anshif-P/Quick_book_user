import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';

import '../../../model/rating_review_model.dart';
import 'reviews_widget.dart';
import 'stars_widget.dart';

class RatingAndReviewWidget extends StatelessWidget {
  const RatingAndReviewWidget({super.key, required this.reviewData});
  final List<ReviewModel> reviewData;
  @override
  Widget build(BuildContext context) {
    final ReviewModel reviewObj = reviewData[0];
    double stars = double.tryParse(reviewObj.stars) ?? 0.0;

// List<bool> boolList = List.generate(5, (index) => index < );
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
                        review: reviewObj.feedback,
                        rating: stars,
                        height: 45,
                      ),
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
                            text: reviewObj.stars,
                          ),
                          CustomTextWidget(
                            color: CustomColors.blackColor,
                            fontSize: 10,
                            fontWeight: FontWeight.w300,
                            text: '${reviewData.length} ratings',
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
                ReviewWidget(reviewData: reviewData),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
