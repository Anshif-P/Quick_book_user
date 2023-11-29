import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/booking_page1_widget/roomtype_and_apply.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';

import 'amentis_selection.dart';
import 'price_filter_widget.dart';

class SearchFilterWidget extends StatelessWidget {
  SearchFilterWidget(
      {super.key,
      required this.ametiesList,
      required this.containerVisiblity,
      required this.searchFilterEnableCheck,
      required this.intialPrice});
  ValueNotifier<List<bool>> ametiesList;
  double minPrice = 500;
  double maxPrice = 15000;
  ValueNotifier<double> intialPrice;
  ValueNotifier<bool> containerVisiblity;
  ValueNotifier searchFilterEnableCheck;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: containerVisiblity,
      builder: (context, value, child) => AnimatedContainer(
        decoration: BoxDecoration(
            color: CustomColors.extraLightGrey,
            borderRadius: BorderRadius.circular(7)),
        duration: Duration(seconds: 0),
        height: containerVisiblity.value ? 250 : 0,
        width: double.maxFinite,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextWidget(
                  text: 'Amenties',
                  color: CustomColors.blackColor,
                  fontSize: 15,
                  fontWeight: FontWeight.w600),
              CheckBoxWidget(amentiesList: ametiesList),
              SizedBox(
                height: 8,
              ),
              PriceFilterWidget(
                maxPrice: 15000,
                minPrice: 500,
                selectedPrice: intialPrice,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ValueListenableBuilder(
                    valueListenable: searchFilterEnableCheck,
                    builder: (context, value, child) =>
                        CustomButtonForCouponApplyType(
                            text: 'Apply',
                            color: CustomColors.mainColor,
                            onPressedFunction: () {
                              containerVisiblity.value = false;
                              searchFilterEnableCheck.value = true;
                              containerVisiblity.notifyListeners();
                              searchFilterEnableCheck.notifyListeners();
                            }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
