import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';

class PriceFilterWidget extends StatelessWidget {
  final double minPrice;
  final double maxPrice;
  final ValueNotifier<double> selectedPrice;

  const PriceFilterWidget({
    super.key,
    required this.minPrice,
    required this.maxPrice,
    required this.selectedPrice,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomTextWidget(
            text: 'Price',
            color: CustomColors.blackColor,
            fontSize: 15,
            fontWeight: FontWeight.w600),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: ValueListenableBuilder(
                  valueListenable: selectedPrice,
                  builder: (context, value, child) => CustomTextWidget(
                      text: '₹${selectedPrice.value.toStringAsFixed(0)}',
                      color: CustomColors.blackColor,
                      fontSize: 12,
                      fontWeight: FontWeight.normal)),
            ),
            // SizedBox(height: 8.0),
            Expanded(
              flex: 9,
              child: ValueListenableBuilder<double>(
                valueListenable: selectedPrice,
                builder: (context, value, child) {
                  return Slider(
                    activeColor: CustomColors.mainColor,
                    min: minPrice,
                    max: maxPrice,
                    value: value,
                    onChanged: (newValue) {
                      selectedPrice.value = newValue;

                      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                      selectedPrice.notifyListeners();
                    },
                  );
                },
              ),
            ),
            const Expanded(
              flex: 2,
              child: CustomTextWidget(
                  text: '₹15000',
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ],
    );
  }
}
