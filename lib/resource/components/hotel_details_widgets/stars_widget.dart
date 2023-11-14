import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';

class StartsWidget extends StatelessWidget {
  StartsWidget(
      {super.key,
      required this.height,
      required this.ratingList,
      this.bottomTextCheck = true,
      this.sizeCheck = true});
  List<bool> ratingList;
  final double height;
  final bool sizeCheck;
  final bool bottomTextCheck;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          //   color: Colors.blue,
          height: height,
          child: GridView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
            ),
            itemCount: 5,
            itemBuilder: (context, index) {
              return Icon(
                Icons.star_rate_rounded,
                size: sizeCheck ? 33 : 10,
                color: ratingList[index] == true
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
                        borderRadius: BorderRadius.circular(3)),
                    child: CustomTextWidget(
                      color: CustomColors.blackColor,
                      fontSize: 9,
                      fontWeight: FontWeight.w400,
                      text: 'Good',
                    ),
                  )
                : const SizedBox())
      ],
    );
  }
}
