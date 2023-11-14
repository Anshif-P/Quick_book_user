import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/resource/components/comman/button_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/view/screen_book_room.dart';
import 'package:shimmer/shimmer.dart';
import '../const/custom_colors.dart';
import '../model/room_model.dart';
import '../resource/components/comman/location_text_widget.dart';
import '../resource/components/hotel_details_widgets/amenties_widget.dart';
import '../resource/components/hotel_details_widgets/details_images_widget.dart';
import '../resource/components/hotel_details_widgets/hotel_details_text_widget.dart';
import '../resource/components/hotel_details_widgets/map_widget.dart';
import '../resource/components/hotel_details_widgets/price_text_widget.dart';
import '../resource/components/hotel_details_widgets/rating_review_widget.dart';

class ScreenRoomDetails extends StatelessWidget {
  ScreenRoomDetails({super.key, required this.data});
  final RoomsModel data;
  final ValueNotifier<int> selectedImageNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.sizeOf(context).height;
    double widthMedia = MediaQuery.sizeOf(context).width;

    return Container(
      color: Colors.transparent,
      child: Scaffold(
        bottomNavigationBar: Container(
          height: 100,
          child: Row(children: [
            Expanded(
                flex: 3,
                child: Container(
                  //  color: Colors.yellow,
                  color: Colors.transparent,

                  child: PriceTextWidget(text: data.price),
                )),
            Expanded(
                flex: 3,
                child: Container(
                  padding: EdgeInsets.only(right: 20),
                  //    color: Colors.blue,
                  child: ButtonWidget(
                      colorCheck: true,
                      onpressFunction: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ScreenBookRoom(
                                  data: data,
                                )));
                      },
                      text: 'Book Now',
                      paymentButtonCheck: true),
                )),
          ]),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(
              parent: BouncingScrollPhysics()),
          child: Stack(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: heightMedia * 0.37,
                    child: ValueListenableBuilder(
                      valueListenable: selectedImageNotifier,
                      builder: (context, value, _) => CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: data.img[selectedImageNotifier.value],
                        placeholder: (context, url) => Shimmer.fromColors(
                          baseColor: Colors.grey.shade300,
                          highlightColor: Colors.grey.shade100,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.yellow,
                                image: DecorationImage(
                                    image: NetworkImage(data.img[0]),
                                    fit: BoxFit.cover)),
                            alignment: Alignment.topLeft,
                            padding: const EdgeInsets.only(top: 15),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: heightMedia * 0.05,
                        ),
                        const HotelDetailsTextWidget(
                          text: 'Hotel Details',
                          sizeCheck: true,
                        ),
                        SizedBox(
                          height: heightMedia * 0.02,
                        ),
                        HotelDetailsTextWidget(
                          text: '${data.description}',
                          colorCheck: true,
                        ),
                        SizedBox(
                          height: heightMedia * 0.03,
                        ),
                        RoomDetailsImagesWidget(
                          imageList: data.img,
                          selecteImageNotifier: selectedImageNotifier,
                          heightMedia: heightMedia,
                          widthMedia: widthMedia,
                        ),
                        SizedBox(
                          height: heightMedia * 0.02,
                        ),
                        const HotelDetailsTextWidget(
                          text: 'Amenties',
                          sizeCheck: true,
                        ),
                        SizedBox(
                          height: heightMedia * 0.02,
                        ),
                        AmentiesWidget(itemsName: data.amenities),
                        CustomTextWidget(
                            text: 'Rating & reviews',
                            color: CustomColors.blackColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                        RatingAndReviewWidget(),
                        MapWidget(),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: heightMedia * 0.3,
                height: heightMedia * .1,
                left: 0,
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: heightMedia * 0.04,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${data.propertyType} ${data.vendorId.propertyName}',
                                  style: GoogleFonts.inter(
                                      textStyle: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 24,
                                  )),
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.star_rate_rounded,
                                      color: CustomColors.mainColor,
                                      size: 20,
                                    ),
                                    Text(
                                      '(4.0)',
                                      style: GoogleFonts.inter(
                                          textStyle: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 20,
                                      )),
                                    )
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: heightMedia * 0.004,
                            ),
                            LocationTextWidget(
                                text1: '${data.state}', text2: '${data.city}'),
                          ]),
                    ),
                  ),
                  //  height: heightMedia,
                ),
              ),
              Positioned(
                top: heightMedia * 0.03,
                left: widthMedia * 0.04,
                child: InkWell(
                  child: Container(
                    width: 40,
                    height: 35,
                    decoration: BoxDecoration(
                        color: CustomColors.mainColor,
                        borderRadius: BorderRadius.circular(14)),
                    child: InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 26,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
