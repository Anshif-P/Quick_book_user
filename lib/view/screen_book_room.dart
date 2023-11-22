import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/booking_bloc/bookings_bloc.dart';
import 'package:hotel_booking_user_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:hotel_booking_user_app/const/custom_colors.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/model/room_model.dart';
import 'package:hotel_booking_user_app/resource/components/booking_page1_widget/price_details_widget.dart';
import 'package:hotel_booking_user_app/resource/components/booking_page1_widget/roomtype_and_apply.dart';
import 'package:hotel_booking_user_app/resource/components/comman/button_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/textfeild.dart';
import 'package:hotel_booking_user_app/utils/validation.dart';
import 'package:hotel_booking_user_app/view/screen_parent_bottom_navigation.dart';
import '../resource/components/booking_page1_widget/coupon_apply_textfeild_widget.dart';
import '../resource/components/booking_page1_widget/date_selecting_widget.dart';
import '../resource/components/booking_page1_widget/guest_room_count_selection_widget.dart';
import '../resource/components/booking_page1_widget/top_image_room_details.dart';

class ScreenBookRoom extends StatelessWidget {
  ScreenBookRoom({super.key, required this.data});
  final TextEditingController couponController = TextEditingController();
  final TextEditingController mobNumberController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final ValueNotifier<int> guestNotifier = ValueNotifier(1);
  final ValueNotifier<int> roomNotifier = ValueNotifier(1);
  final GlobalKey<FormState> bookingFormKey = GlobalKey<FormState>();
  bool bookingLoadingCheck = false;
  final RoomsModel data;
  ValueNotifier<DateTimeRange> dateRangeNotifier =
      ValueNotifier<DateTimeRange>(DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  ));

  @override
  Widget build(BuildContext context) {
    final double heightTemp = MediaQuery.sizeOf(context).height;
    final double safeareaHeight = MediaQuery.of(context).padding.top;
    final double screenHeight = heightTemp - safeareaHeight;

    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: bookingFormKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back)),
                  const SizedBox(
                    width: 80,
                  ),
                  CustomTextWidget(
                      text: 'Booking details',
                      color: CustomColors.blackColor,
                      fontSize: 19,
                      fontWeight: FontWeight.w600)
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TopRomInfoWidget(
                data: data,
                screenHeight: screenHeight,
              ),
              const SizedBox(
                height: 20,
              ),
              CustomTextWidget(
                  text: 'Enter Your Details',
                  color: CustomColors.blackColor,
                  fontSize: 19,
                  fontWeight: FontWeight.normal),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  keybordType: true,
                  text: 'Enter mobile number',
                  hintText: 'enter your mobile number',
                  controller: mobNumberController,
                  icon: Icons.phone,
                  validator: (value) => Validations.numberValidation(value)),
              const SizedBox(
                height: 20,
              ),
              TextFieldWidget(
                  text: 'Enter address',
                  hintText: 'enter your address',
                  controller: addressController,
                  icon: Icons.menu_book_rounded,
                  validator: (value) => Validations.emtyValidation(value)),
              const SizedBox(
                height: 20,
              ),
              DateSelectionWidget(dateRange: dateRangeNotifier),
              const SizedBox(
                height: 20,
              ),
              ValueListenableBuilder(
                valueListenable: guestNotifier,
                builder: (context, value, _) => RoomGuestCountSelection(
                    guestOrRoomCheck: true,
                    data: data,
                    notifier: guestNotifier,
                    text: 'Guest',
                    icon: Icons.person_outline_outlined),
              ),
              const SizedBox(
                height: 15,
              ),
              RoomGuestCountSelection(
                  guestOrRoomCheck: false,
                  data: data,
                  notifier: roomNotifier,
                  text: 'Room',
                  icon: Icons.bed_outlined),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextWidget(
                        text: 'Room Type',
                        color: CustomColors.blackColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w600),
                  ),
                  Expanded(
                      flex: 2,
                      child: CustomButtonForCouponApplyType(
                          text: data.propertyType,
                          color: CustomColors.greenColor,
                          onPressedFunction: () {}))
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(children: [
                Expanded(
                  flex: 7,
                  child: CouponApplyTextFeild(
                    controller: couponController,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                    flex: 3,
                    child: CustomButtonForCouponApplyType(
                        text: 'Apply',
                        color: CustomColors.mainColor,
                        onPressedFunction: () {})),
              ]),
              const SizedBox(
                height: 30,
              ),
              PriceDetailsWidget(
                numberOfRoomsNotifeir: roomNotifier,
                data: data,
                dates: dateRangeNotifier,
              ),
              const SizedBox(
                height: 30,
              ),
              BlocConsumer<BookingsBloc, BookingsState>(
                  listener: (context, state) {
                if (state is BookingDateNotAvailableState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text(state.errorMessage)));
                  bookingLoadingCheck = false;
                }
                if (state is BookingLoadingState) {
                  bookingLoadingCheck = true;
                }
                if (state is BookingSuccessState) {
                  final token = SharedPrefModel.instance.getData('token');
                  context
                      .read<RoomsBloc>()
                      .add(FetchBookedRoomsEvent(token: token));
                  bookingLoadingCheck = false;
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: const Text('Room Booked Successfully'),
                    backgroundColor: CustomColors.greenColor,
                  ));
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => ScreenParentNavigation()));
                }
              }, builder: (context, state) {
                return ButtonWidget(
                    loadingCheck: bookingLoadingCheck,
                    onpressFunction: () {
                      bookNowButtonFunction(context);
                    },
                    text: 'Book Now',
                    colorCheck: true);
              }),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      )),
    );
  }

  bookNowButtonFunction(BuildContext context) async {
    if (bookingFormKey.currentState!.validate()) {
      context.read<BookingsBloc>().add(FetchBookingDates(
          address: addressController.text,
          dates: dateRangeNotifier.value,
          data: data,
          mobNumber: mobNumberController.text,
          guest: guestNotifier.value,
          rooms: roomNotifier.value,
          bookingsData: dateRangeNotifier.value,
          startDate: dateRangeNotifier.value.start.toString(),
          endDate: dateRangeNotifier.value.end.toString()));
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Fill all fields')));
    }
  }
}
