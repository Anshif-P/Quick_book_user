import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/model/room_model.dart';
import 'package:hotel_booking_user_app/resource/components/comman/card_text_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/location_text_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/room_rating_widget.dart';
import 'package:shimmer/shimmer.dart';

import 'room_card_price_widget.dart';
import 'room_card_text_widget.dart';

class RoomsCardWidget extends StatelessWidget {
  final RoomsModel data;
  const RoomsCardWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 113,
          decoration: BoxDecoration(
              // color: Colors.blue,
              borderRadius: BorderRadius.circular(7)),
          child: Row(
            children: [
              Expanded(
                  flex: 3,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(7),
                    child: CachedNetworkImage(
                      height: 113,
                      imageUrl: data.img[0],
                      fit: BoxFit.cover,
                      placeholder: (context, url) => Shimmer.fromColors(
                        baseColor: Colors.grey.shade300,
                        highlightColor: Colors.grey.shade100,
                        child: Container(
                          height: 113,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: NetworkImage(data.img[0]),
                                  fit: BoxFit.cover),
                              color: Colors.blue[900],
                              borderRadius: BorderRadius.circular(7)),
                        ),
                      ),
                    ),
                  )),
              Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CardsHeadingTextWidget(
                              text:
                                  '${data.vendorId.propertyName} ${data.propertyType}'),
                          const SizedBox(
                            height: 4,
                          ),
                          LocationTextWidget(
                              text1: data.state, text2: data.city),
                          const SizedBox(
                            height: 4,
                          ),
                          RoomCardTextWidget(
                            text: 'Capacity : ${data.capacity}',
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          RoomCardTextWidget(
                            text: data.description,
                            colorSizeCheck: true,
                          ),
                          const SizedBox(
                            height: 4,
                          ),
                          const RoomCardTextWidget(text: 'Room Price :'),
                        ]),
                  )),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(),
                    RoomCardPriceWidget(
                      text: data.price,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Container(
          height: 1,
          color: CustomColors.lightGreyColor,
        )
      ],
    );
  }
}
