import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';

class CategoryCardWidget extends StatelessWidget {
  const CategoryCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.5,
      ),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: 4,
      itemBuilder: (context, index) {
        return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            height: 129,
            width: 178,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(7)),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 84,
                    decoration: BoxDecoration(
                        color: Colors.blue[900],
                        borderRadius: BorderRadius.circular(7)),
                  ),
                ),
                CustomTextWidget(
                    text: 'Classic',
                    color: CustomColors.blackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600)
              ],
            ),
          )
        ]);
      },
    );
  }
}
