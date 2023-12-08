import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/search_bloc/search_bloc.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/booking_page1_widget/roomtype_and_apply.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';

import 'amentis_selection.dart';
import 'price_filter_widget.dart';

// ignore: must_be_immutable
class SearchFilterWidget extends StatelessWidget {
  SearchFilterWidget(
      {super.key,
      required this.queryNotifier,
      required this.ametiesList,
      required this.containerVisiblity,
      required this.filterResult,
      required this.selectedPrice});
  ValueNotifier<List<String>> ametiesList;

  ValueNotifier<double> selectedPrice;
  ValueNotifier<bool> containerVisiblity;
  ValueNotifier<String> queryNotifier;

  ValueNotifier filterResult;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: containerVisiblity,
      builder: (context, value, child) => AnimatedContainer(
        decoration: BoxDecoration(
            color: CustomColors.extraLightGrey,
            borderRadius: BorderRadius.circular(7)),
        duration: const Duration(seconds: 0),
        height: containerVisiblity.value ? 270 : 0,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CustomTextWidget(
                    text: 'Amenties',
                    color: CustomColors.blackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.w600),
                CheckBoxWidget(filterList: ametiesList),
                const SizedBox(
                  height: 8,
                ),
                PriceFilterWidget(
                  maxPrice: 15000,
                  minPrice: 500,
                  selectedPrice: selectedPrice,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ValueListenableBuilder(
                      valueListenable: queryNotifier,
                      builder: (context, value, child) =>
                          CustomButtonForCouponApplyType(
                              text: 'Apply',
                              color: CustomColors.mainColor,
                              onPressedFunction: () {
                                containerVisiblity.value =
                                    !containerVisiblity.value;
                                context.read<SearchBloc>().add(SearchHotelEvent(
                                    query: value,
                                    amentiesList: ametiesList.value,
                                    priceRange: selectedPrice.value));
                              }),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
