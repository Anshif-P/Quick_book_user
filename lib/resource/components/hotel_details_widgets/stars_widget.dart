import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';

// ignore: must_be_immutable
class StartsWidget extends StatelessWidget {
  StartsWidget({
    super.key,
    required this.height,
    required this.rating,
    this.bottomTextCheck = true,
    this.sizeCheck = true,
    required this.review,
  });

  final double rating;
  final double height;
  final bool sizeCheck;
  final bool bottomTextCheck;
  final String review;
  String? reviewStand;

  @override
  Widget build(BuildContext context) {
    int numberOfStars =
        rating.clamp(0, 5).toInt(); // Ensure the rating is between 0 and 5

    if (numberOfStars > 3) {
      reviewStand = 'good';
    } else if (numberOfStars < 3 && numberOfStars > 2) {
      reviewStand = 'average';
    } else if (numberOfStars < 2) {
      reviewStand = 'poor';
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          height: height,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Icon(
                Icons.star_rate_rounded,
                size: sizeCheck ? 33 : 10,
                color: index < numberOfStars
                    ? CustomColors.mainColor
                    : CustomColors.grey,
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 5, top: 7),
          child: bottomTextCheck
              ? Container(
                  alignment: Alignment.center,
                  width: 40,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: CustomTextWidget(
                    color: CustomColors.blackColor,
                    fontSize: 9,
                    fontWeight: FontWeight.w400,
                    text: reviewStand ?? '',
                  ),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
