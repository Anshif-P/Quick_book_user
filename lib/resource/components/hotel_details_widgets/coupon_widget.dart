// import 'package:flutter/material.dart';
// import 'package:hotel_booking_user_app/const/custom_colors.dart';
// import 'package:hotel_booking_user_app/model/coupon_model.dart';
// import 'package:hotel_booking_user_app/model/room_model.dart';
// import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';

// class CouponWidget extends StatelessWidget {
//   const CouponWidget(
//       {super.key, required this.couponList, required this.roomModel});
//   final List<CouponModel> couponList;
//   final RoomsModel roomModel;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.white, borderRadius: BorderRadius.circular(7)),
//       height: 90,
//       child: ListView.separated(
//           separatorBuilder: (context, index) => SizedBox(
//                 width: 10,
//               ),
//           scrollDirection: Axis.horizontal,
//           itemCount: couponList.length,
//           itemBuilder: (context, index) {
//             final data = couponList[index];
//             return Container(
//               height: 90,
//               width: 300,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Expanded(
//                       flex: 5,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: CustomColors.searchTextFeildColor,
//                             borderRadius: BorderRadius.circular(7)),
//                         child: Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               CustomTextWidget(
//                                   text:
//                                       '${roomModel.propertyType} ${roomModel.vendorId.propertyName}',
//                                   color: CustomColors.blackColor,
//                                   fontSize: 13,
//                                   fontWeight: FontWeight.w600),
//                               const SizedBox(
//                                 height: 7,
//                               ),
//                               CustomTextWidget(
//                                   text:
//                                       'Flat ₹${data.discount} limited time only',
//                                   color: CustomColors.blackColor,
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.normal),
//                               const SizedBox(
//                                 height: 5,
//                               ),
//                               CustomTextWidget(
//                                   text: 'Coupon Code : ${data.couponCode}',
//                                   color: CustomColors.blackColor,
//                                   fontSize: 10,
//                                   fontWeight: FontWeight.normal),
//                               const SizedBox(
//                                 height: 10,
//                               ),
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.end,
//                                 children: [
//                                   CustomTextWidget(
//                                       text: 'T&C apply',
//                                       color: CustomColors.blackColor,
//                                       fontSize: 10,
//                                       fontWeight: FontWeight.normal),
//                                 ],
//                               )
//                             ],
//                           ),
//                         ),
//                       )),
//                   Expanded(
//                       flex: 2,
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: CustomColors.blackColor,
//                             borderRadius: const BorderRadius.only(
//                                 topRight: Radius.circular(8),
//                                 bottomRight: Radius.circular(8))),
//                         child: const Center(
//                           child: CustomTextWidget(
//                               text: 'Copy code',
//                               color: Colors.white,
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600),
//                         ),
//                       ))
//                 ],
//               ),
//             );
//           }),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/model/coupon_model.dart';
import 'package:hotel_booking_user_app/model/room_model.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';

class CouponWidget extends StatelessWidget {
  const CouponWidget({
    Key? key,
    required this.couponList,
    required this.roomModel,
  }) : super(key: key);

  final List<CouponModel> couponList;
  final RoomsModel roomModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      height: 90,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        scrollDirection: Axis.horizontal,
        itemCount: couponList.length,
        itemBuilder: (context, index) {
          final data = couponList[index];
          return Container(
            height: 90,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: BoxDecoration(
                      color: CustomColors.searchTextFeildColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            text:
                                '${roomModel.propertyType} ${roomModel.vendorId.propertyName}',
                            color: CustomColors.blackColor,
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          CustomTextWidget(
                            text: 'Flat ₹${data.discount} limited time only',
                            color: CustomColors.blackColor,
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          CustomTextWidget(
                            text: 'Coupon Code : ${data.couponCode}',
                            color: CustomColors.blackColor,
                            fontSize: 10,
                            fontWeight: FontWeight.normal,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              CustomTextWidget(
                                text: 'T&C apply',
                                color: CustomColors.blackColor,
                                fontSize: 10,
                                fontWeight: FontWeight.normal,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: GestureDetector(
                    onTap: () {
                      _copyToClipboard(data.couponCode);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: CustomColors.blackColor,
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(8),
                        ),
                      ),
                      child: const Center(
                        child: CustomTextWidget(
                          text: 'Copy code',
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void _copyToClipboard(String couponCode) {
    Clipboard.setData(ClipboardData(text: couponCode));
    Fluttertoast.showToast(
      msg: 'Coupon code copied to clipboard',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.black,
      textColor: Colors.white,
    );
  }
}
