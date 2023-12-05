import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/blocs/coupon_bloc/coupon_bloc.dart';
import 'package:hotel_booking_user_app/blocs/review_bloc/review_bloc.dart';
import 'package:hotel_booking_user_app/blocs/wishlist_bloc/wishlist_bloc.dart';
import 'package:hotel_booking_user_app/resource/components/comman/button_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/view/screen_payment.dart';
import '../model/coupon_model.dart';
import '../resource/const/custom_colors.dart';
import '../model/room_model.dart';
import '../resource/components/comman/favorite_widget.dart';
import '../resource/components/comman/location_text_widget.dart';
import '../resource/components/hotel_details_widgets/amenties_widget.dart';
import '../resource/components/hotel_details_widgets/coupon_widget.dart';
import '../resource/components/hotel_details_widgets/details_images_widget.dart';
import '../resource/components/hotel_details_widgets/hotel_details_text_widget.dart';
import '../resource/components/hotel_details_widgets/map_widget.dart';
import '../resource/components/hotel_details_widgets/price_text_widget.dart';
import '../resource/components/hotel_details_widgets/rating_review_widget.dart';
import '../resource/loaders/coupon_shimmer_loading.dart';
import '../resource/loaders/review_shimmer_loading.dart';
import '../resource/components/comman/image_preview_widget.dart';

class ScreenRoomDetails extends StatelessWidget {
  ScreenRoomDetails({super.key, required this.data});
  final RoomsModel data;
  List<CouponModel> couponList = [];

  final ValueNotifier<int> selectedImageNotifier = ValueNotifier(0);

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
                            builder: (context) => ScreenPayment(
                                  coupon: couponList!,
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
                      builder: (context, value, child) => ImagePreviewWidget(
                          data: data,
                          selectedImageNotifier: selectedImageNotifier),
                      // builder: (context, value, _) => CachedNetworkImage(
                      //   fit: BoxFit.cover,
                      //   imageUrl: data.img[selectedImageNotifier.value],
                      //   placeholder: (context, url) => Shimmer.fromColors(
                      //     baseColor: Colors.grey.shade300,
                      //     highlightColor: Colors.grey.shade100,
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //           color: Colors.yellow,
                      //           image: DecorationImage(
                      //               image: NetworkImage(data.img[0]),
                      //               fit: BoxFit.cover)),
                      //       alignment: Alignment.topLeft,
                      //       padding: const EdgeInsets.only(top: 15),
                      //     ),
                      //   ),
                      // ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
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
                            SizedBox(height: heightMedia * 0.02),
                            const CustomTextWidget(
                                text: 'Coupons',
                                color: CustomColors.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)
                          ],
                        ),
                      ),
                      SizedBox(
                        height: heightMedia * 0.02,
                      ),
                      Container(
                        height: 90,
                        padding: EdgeInsets.only(left: 20),
                        child: BlocBuilder<CouponBloc, CouponState>(
                          builder: (context, state) {
                            if (state is CouponFetchLoadingState) {
                              return CouponShimmerLoadingWidget();
                            }
                            if (state is CouponFetchSuccessState) {
                              couponList = state.couponObjList;
                              return CouponWidget(
                                roomModel: data,
                                couponList: state.couponObjList,
                              );
                            }
                            // if (couponList.isEmpty) {
                            //   return const Center(
                            //     child: Text('No Coupons Available'),
                            //   );
                            // }
                            return const SizedBox();
                          },
                        ),
                      ),
                      SizedBox(
                        height: heightMedia * 0.02,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CustomTextWidget(
                                text: 'Rating & reviews',
                                color: CustomColors.blackColor,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            BlocConsumer<ReviewBloc, ReviewState>(
                              listenWhen: (previous, current) =>
                                  current is ReviewActionState,
                              buildWhen: (previous, current) =>
                                  current is ReviewActionState,
                              listener: (context, state) {},
                              builder: (context, state) {
                                if (state is ReviewFetchLoadingState) {
                                  return RatingReviewShimmerLoadingWidget();
                                }
                                if (state is ReviewFetchSuccessState) {
                                  print(
                                      '${state.reviewObjList.length}--------------------length');
                                  if (state.reviewObjList.isNotEmpty) {
                                    return RatingAndReviewWidget(
                                      reviewData: state.reviewObjList,
                                    );
                                  } else {
                                    return const Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 15,
                                        ),
                                        Center(child: Text('No Reviews')),
                                      ],
                                    );
                                  }
                                }
                                if (state is ReviewFetchErrorState) {
                                  return Text(state.errorMessage);
                                }
                                return const Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Center(child: Text('No Reviews')),
                                  ],
                                );
                              },
                            ),
                            MapWidget(
                              latitude: data.latitude,
                              longitude: double.parse(data.longitude),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                                  data.vendorId.propertyName,
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
                                    BlocBuilder<ReviewBloc, ReviewState>(
                                      builder: (context, state) {
                                        if (state is ReviewFetchSuccessState &&
                                            state.reviewObjList.isNotEmpty) {
                                          return Text(
                                            '(${state.reviewObjList[0].stars})',
                                            style: GoogleFonts.inter(
                                                textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            )),
                                          );
                                        } else {
                                          return Text(
                                            '(0)',
                                            style: GoogleFonts.inter(
                                                textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                            )),
                                          );
                                        }
                                      },
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
                ),
              ),
              Positioned(
                top: heightMedia * 0.06,
                left: widthMedia * 0.04,
                child: InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    alignment: Alignment.center,
                    width: 40,
                    height: 35,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7)),
                    child: const Icon(
                      Icons.arrow_back_ios,
                      color: CustomColors.blackColor,
                      size: 16,
                    ),
                  ),
                ),
              ),
              Positioned(
                  top: heightMedia * 0.06,
                  right: widthMedia * 0.07,
                  child: BlocBuilder<WishlistBloc, WishlistState>(
                      builder: (context, state) {
                    if (state is FetchWishlistSuccessState) {
                      return FavoriteWidget(
                        wishlist: state.wishlist,
                        data: data,
                      );
                    }
                    return SizedBox();
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
