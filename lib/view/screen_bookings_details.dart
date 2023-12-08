import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/model/booked_rooms_model.dart';
import 'package:intl/intl.dart';
import 'package:shimmer/shimmer.dart';
import '../resource/const/custom_colors.dart';
import '../resource/components/bookings_widgets.dart/amount_text_widget.dart';
import '../resource/components/bookings_widgets.dart/checkin_checkout_widget.dart';
import '../resource/components/bookings_widgets.dart/checkin_text_widget.dart';
import '../resource/components/bookings_widgets.dart/room_status_widget.dart';
import '../resource/components/comman/heading_text_widget.dart';
import '../resource/components/comman/location_text_widget.dart';
import '../resource/components/details_booking_widget.dart/customer_information.dart';
import '../resource/components/details_booking_widget.dart/details_booking_rooms_guest_widget.dart';

class ScreenBookingDetails extends StatelessWidget {
  const ScreenBookingDetails({super.key, required this.data});
  final BookedRoomModel data;
  @override
  Widget build(BuildContext context) {
    final String status =
        DateTime.now().isAfter(data.checkOut) ? 'Checked Out' : 'Active';
    String formattedCheckIn = DateFormat('EEE,MMM d -').format(data.checkIn);
    String formattedCheckOut = DateFormat('EEE,MMM d').format(data.checkOut);

    double heightMedia = MediaQuery.sizeOf(context).height;
    double widthMedia = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Column(children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: heightMedia * 0.04),
              Row(children: [
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.arrow_back)),
                SizedBox(width: widthMedia * 0.1),
                const HeadingTextWidget(text: 'Booking Details')
              ]),
              SizedBox(height: heightMedia * 0.03),
              ClipRRect(
                borderRadius: BorderRadius.circular(7),
                child: CachedNetworkImage(
                  height: heightMedia * 0.19,
                  width: double.maxFinite,
                  imageUrl: data.roomId.img[0],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                        height: heightMedia * 0.19,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(data.roomId.img[0]),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(7))),
                  ),
                ),
              ),
              SizedBox(height: heightMedia * 0.023),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(data.vendorId.propertyName,
                    style: GoogleFonts.inter(
                        fontSize: 19, fontWeight: FontWeight.w600)),
                const Row(children: [
                  Icon(Icons.star_rate_rounded,
                      color: CustomColors.mainColor, size: 18),
                  BookingDetailsTextWidget(
                    text: '(4.0)',
                  ),
                ])
              ]),
              SizedBox(height: heightMedia * 0.005),
              LocationTextWidget(
                  text1: data.roomId.state, text2: data.roomId.location),
              SizedBox(height: heightMedia * 0.015),
              BookingDetailsTextWidget(text: 'Booking ID : ${data.id}'),
              SizedBox(height: heightMedia * 0.015),
              Row(children: [
                const BookingDetailsTextWidget(text: 'Room Rate :'),
                AmountText(
                  text: data.total.toString(),
                )
              ]),
              SizedBox(height: heightMedia * 0.015),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                const BookingDetailsTextWidget(text: 'Status :'),
                RoomStatusWidget(
                    heightMedia: heightMedia,
                    widthMedia: widthMedia,
                    text: status)
              ]),
              SizedBox(height: heightMedia * 0.02),
              CheckInCheckOutWidget(
                checkInData: formattedCheckIn,
                checkOutData: formattedCheckOut,
                heightMedia: heightMedia,
                widthMedia: widthMedia,
              ),
              SizedBox(height: heightMedia * 0.01),
              const Divider(thickness: 0.5, color: CustomColors.lightGreyColor),
              SizedBox(height: heightMedia * 0.01),
              CheckinDayTotalRoomInfoWidget(
                heightMedia: heightMedia,
                widthMedia: widthMedia,
                adult: data.adult.toString(),
                days: data.days.toString(),
                roomType: data.roomId.category,
                totalRoom: '3',
              ),
              BookingDetailsTextWidget(
                text: '${data.roomId.propertyType} infomation',
                sizeCheck: true,
              ),
              SizedBox(height: heightMedia * 0.015),
            ])),
        Expanded(
            child: CustomerInformationWidget(
          heightMedia: heightMedia,
          widthMedia: widthMedia,
          address:
              '${data.vendorId.propertyName} ${data.roomId.city} ${data.roomId.state}',
          mobNo: data.vendorId.phone,
          name: data.vendorId.name,
        )),
      ]),
    );
  }
}
