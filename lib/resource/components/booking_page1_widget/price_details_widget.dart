import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import '../../../model/room_model.dart';

class PriceDetailsWidget extends StatelessWidget {
  const PriceDetailsWidget(
      {super.key,
      required this.data,
      required this.dates,
      required this.numberOfRoomsNotifeir});
  final RoomsModel data;
  final ValueNotifier<DateTimeRange> dates;
  final ValueNotifier<int> numberOfRoomsNotifeir;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: numberOfRoomsNotifeir,
      builder: (context, value_, _) => ValueListenableBuilder(
          valueListenable: dates,
          builder: (context, value, child) {
            final duration = value.duration;
            final daysDifference = duration.inDays + 1;
            final tempPrice = int.parse(data.price);
            var totalAmount = daysDifference * tempPrice * value_;

            return Container(
              height: 230,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: CustomColors.priceDetailsBackground,
                  borderRadius: BorderRadius.circular(7)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                        text: 'Price details',
                        color: CustomColors.blackColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                            text: 'Discount',
                            color: CustomColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        CustomTextWidget(
                            text: '₹0',
                            color: CustomColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                            text: 'Day price',
                            color: CustomColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        CustomTextWidget(
                            text: '₹${data.price}',
                            color: CustomColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                            text: 'Room price',
                            color: CustomColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        CustomTextWidget(
                            text: '₹${totalAmount.toString()}',
                            color: CustomColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 0.5,
                      color: CustomColors.blackColor,
                      width: double.maxFinite,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                            text: 'Total price',
                            color: CustomColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                        CustomTextWidget(
                            text: '₹${totalAmount.toString()}',
                            color: CustomColors.greenColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
