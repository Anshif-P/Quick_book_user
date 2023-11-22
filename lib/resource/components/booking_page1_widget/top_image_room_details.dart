import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/location_text_widget.dart';
import 'package:hotel_booking_user_app/resource/components/hotel_details_widgets/price_text_widget.dart';
import 'package:shimmer/shimmer.dart';
import '../../../model/room_model.dart';

class TopRomInfoWidget extends StatelessWidget {
  final double screenHeight;
  final RoomsModel data;
  const TopRomInfoWidget(
      {super.key, required this.screenHeight, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      constraints: const BoxConstraints(minHeight: 100),
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  height: screenHeight * 0.13,
                  imageUrl: data.img[0],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      height: screenHeight * 0.13,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(data.img[0]),
                              fit: BoxFit.cover),
                          //   color: Colors.green,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 6,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                            text:
                                '${data.vendorId.propertyName} ${data.propertyType}',
                            color: CustomColors.blackColor,
                            fontSize: 19,
                            fontWeight: FontWeight.w600),
                        LocationTextWidget(text1: data.state, text2: data.city),
                      ],
                    ),
                    Container(
                        //        color: Colors.green,
                        child: PriceTextWidget(
                      text: data.price,
                      paddingCheck: false,
                    )),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
