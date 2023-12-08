import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import '../../../model/room_model.dart';

class PriceDetailsWidget extends StatefulWidget {
  const PriceDetailsWidget(
      {super.key,
      required this.data,
      required this.dates,
      required this.totalPrice,
      required this.discoutAmount,
      required this.numberOfRoomsNotifeir});
  final RoomsModel data;
  final ValueNotifier<DateTimeRange> dates;
  final ValueNotifier<int> numberOfRoomsNotifeir;
  final ValueNotifier<int> totalPrice;
  final ValueNotifier<int> discoutAmount;

  @override
  State<PriceDetailsWidget> createState() => _PriceDetailsWidgetState();
}

class _PriceDetailsWidgetState extends State<PriceDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: widget.numberOfRoomsNotifeir,
      builder: (context, value_, _) => ValueListenableBuilder(
          valueListenable: widget.dates,
          builder: (context, value, child) {
            final duration = value.duration;
            final daysDifference = duration.inDays + 1;
            final tempPrice = int.parse(widget.data.price);
            widget.totalPrice.value = daysDifference * tempPrice * value_;

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
                    const CustomTextWidget(
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
                        const CustomTextWidget(
                            text: 'Discount',
                            color: CustomColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        ValueListenableBuilder(
                          valueListenable: widget.discoutAmount,
                          builder: (context, value, child) {
                            return CustomTextWidget(
                                text: '₹${value.toString()}',
                                color: CustomColors.blackColor,
                                fontSize: 14,
                                fontWeight: FontWeight.normal);
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const CustomTextWidget(
                            text: 'Day price',
                            color: CustomColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        CustomTextWidget(
                            text: '₹${widget.data.price}',
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
                        const CustomTextWidget(
                            text: 'Room price',
                            color: CustomColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.normal),
                        ValueListenableBuilder<int>(
                            valueListenable: widget.totalPrice,
                            builder: (context, value, child) {
                              return CustomTextWidget(
                                  text: '₹${value.toString()}',
                                  color: CustomColors.blackColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.normal);
                            }),
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
                        const CustomTextWidget(
                          text: 'Total price',
                          color: CustomColors.blackColor,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                        ValueListenableBuilder<int>(
                          valueListenable: widget.totalPrice,
                          builder: (context, value, child) {
                            return CustomTextWidget(
                              text:
                                  '₹${(value - widget.discoutAmount.value).toString()}',
                              color: CustomColors.greenColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            );
                          },
                        ),
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
