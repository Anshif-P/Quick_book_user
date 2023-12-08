import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/blocs/home_bloc/home_bloc.dart';
import 'package:hotel_booking_user_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:hotel_booking_user_app/model/room_model.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/model/booked_rooms_model.dart';
import 'package:hotel_booking_user_app/resource/components/bookings_widgets.dart/bottom_sheet_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/card_text_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/view/screen_bookings_details.dart';
import 'package:hotel_booking_user_app/view/screen_room_details.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../../../blocs/coupon_bloc/coupon_bloc.dart';
import '../../../blocs/review_bloc/review_bloc.dart';
import '../../../data/shared_preferences/shared_pref_model.dart';
import '../comman/custom_show_diolog.dart';
import '../comman/location_text_widget.dart';
import 'booking_rateus_button_widget.dart';
import 'booking_text_widget.dart';

// ignore: must_be_immutable
class BookingCardWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  final bool checkedOutOrUpcomingCheck;
  final TextEditingController reviewController = TextEditingController();
  final ValueNotifier<bool> ratingUpdateCheck = ValueNotifier(false);
  final BuildContext? homeContext;
  final BookedRoomModel data;
  bool cancelButtomLoading = false;
  List<RoomsModel>? totalRooms;
  BookingCardWidget({
    Key? key,
    this.homeContext,
    required this.data,
    required this.checkedOutOrUpcomingCheck,
    required this.heightMedia,
    required this.widthMedia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedCheckIn = DateFormat('EEE,MMM d -').format(data.checkIn);
    String formattedCheckOut = DateFormat('d,EEE MMM').format(data.checkOut);

    return Container(
        decoration: BoxDecoration(
            //color: Colors.yellow,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: CustomColors.lightGreyColor)),
        height: heightMedia * 0.199,
        width: double.maxFinite,
        constraints: const BoxConstraints(minHeight: 150),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ScreenBookingDetails(
                          data: data,
                        ))),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        flex: 3,
                        child: Container(
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(13),
                              child: CachedNetworkImage(
                                fit: BoxFit.cover,
                                imageUrl: data.roomId.img[0],
                                placeholder: (context, url) =>
                                    Shimmer.fromColors(
                                  baseColor: Colors.grey.shade300,
                                  highlightColor: Colors.grey.shade100,
                                  child: Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                data.roomId.img[0])),
                                        borderRadius:
                                            BorderRadius.circular(13)),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )),
                    Expanded(
                        flex: 4,
                        child: SizedBox(
                          width: double.maxFinite,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8, top: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CardsHeadingTextWidget(
                                    text: data.vendorId.propertyName),
                                const SizedBox(
                                  height: 4,
                                ),
                                LocationTextWidget(
                                  text1: data.roomId.state,
                                  text2: data.location,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                BookingTextWidget(
                                    text1: formattedCheckIn,
                                    text2: formattedCheckOut),
                                const SizedBox(
                                  height: 5,
                                ),
                                BookingTextWidget(
                                    text1: 'Room ${data.rooms.toString()},',
                                    text2: 'Adult ${data.adult.toString()}'),
                              ],
                            ),
                          ),
                        )),
                    const Expanded(
                      flex: 2,
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: []),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                      decoration: const BoxDecoration(
                          color: CustomColors.extraLightGrey,
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                      height: 40, // Adjust the height here as needed
                      width: double.infinity,
                      child: Padding(
                          padding: checkedOutOrUpcomingCheck
                              ? const EdgeInsets.all(0)
                              : const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(children: [
                            Expanded(
                                flex: 1,
                                child: checkedOutOrUpcomingCheck
                                    ? RateUsBookAgainButtonWidget(
                                        colorCheck: false,
                                        onpressFunction: () {
                                          showModalBottomSheet(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return BottomSheetWidget(
                                                homeContext: homeContext!,
                                                data: data,
                                                reviewController:
                                                    reviewController,
                                              );
                                            },
                                          );
                                        },
                                        radiusCheck: true,
                                        borderCheck: true,
                                        text: 'Rate Us',
                                      )
                                    : const Row(
                                        children: [
                                          Icon(Icons.cancel_presentation),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          CustomTextWidget(
                                              text: 'Cancel Booking',
                                              color: CustomColors.mainColor,
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal),
                                        ],
                                      )),
                            Expanded(
                                flex: 1,
                                child: checkedOutOrUpcomingCheck
                                    ? BlocBuilder<HomeBloc, HomeState>(
                                        builder: (context, state) {
                                          if (state
                                              is HomeFetchRoomsSuccessState) {
                                            totalRooms = state.totalRoomList;
                                            totalRooms = totalRooms!
                                                .where((element) =>
                                                    element.id ==
                                                    data.roomId.id)
                                                .toList();
                                          }
                                          return RateUsBookAgainButtonWidget(
                                            colorCheck: true,
                                            onpressFunction: () {
                                              final token = SharedPrefModel
                                                  .instance
                                                  .getData('token');
                                              context.read<CouponBloc>().add(
                                                  GetRoomCouponsEvent(
                                                      vendorId:
                                                          data.vendorId.id,
                                                      token: token));
                                              context
                                                  .read<ReviewBloc>()
                                                  .add(GetRoomReviews(
                                                    roomId: data.id,
                                                    token: token,
                                                  ));
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ScreenRoomDetails(
                                                              data: totalRooms![
                                                                  0])));
                                            },
                                            radiusCheck: false,
                                            text: 'Book Again',
                                          );
                                        },
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                            SizedBox(
                                              height: 30,
                                              width: 80,
                                              child: BlocConsumer<RoomsBloc,
                                                  RoomsState>(
                                                listener: (context, state) {
                                                  if (state
                                                      is CancelBookingLoadingState) {
                                                    cancelButtomLoading = true;
                                                  }
                                                },
                                                builder: (context, state) {
                                                  return ElevatedButton(
                                                      style: ButtonStyle(
                                                        elevation:
                                                            MaterialStateProperty
                                                                .all(0),
                                                        minimumSize:
                                                            MaterialStateProperty
                                                                .all(const Size(
                                                                    10, 25)),
                                                        backgroundColor:
                                                            MaterialStateProperty
                                                                .all(CustomColors
                                                                    .mainColor),
                                                      ),
                                                      onPressed: () {
                                                        showDialog(
                                                          context: context,
                                                          builder: (context) => CustomAlertDialogWidget(
                                                              text1:
                                                                  'Room Cancelation',
                                                              text2:
                                                                  'Do you want to Cancel Room',
                                                              text3: 'Cancel',
                                                              text4: 'Confirm',
                                                              onPressFunction: () => context
                                                                  .read<
                                                                      RoomsBloc>()
                                                                  .add(CancelBookingEvent(
                                                                      bookingId:
                                                                          data.id))),
                                                        );
                                                      },
                                                      child: cancelButtomLoading
                                                          ? Transform.scale(
                                                              scale: 0.5,
                                                              child:
                                                                  const CircularProgressIndicator(
                                                                      strokeWidth:
                                                                          05),
                                                            )
                                                          : Text('Cancel',
                                                              style: GoogleFonts
                                                                  .inter(
                                                                      textStyle:
                                                                          const TextStyle(
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w600,
                                                                fontSize: 10,
                                                              ))));
                                                },
                                              ),
                                            )
                                          ]))
                          ]))))
            ]));
  }
}
