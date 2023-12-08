import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/coupon_bloc/coupon_bloc.dart';
import 'package:hotel_booking_user_app/blocs/payment_bloc/payment_bloc.dart';
import 'package:hotel_booking_user_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/model/room_model.dart';
import 'package:hotel_booking_user_app/resource/components/booking_page1_widget/price_details_widget.dart';
import 'package:hotel_booking_user_app/resource/components/booking_page1_widget/roomtype_and_apply.dart';
import 'package:hotel_booking_user_app/resource/components/comman/button_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/textfeild.dart';
import 'package:hotel_booking_user_app/utils/validation.dart';
import 'package:hotel_booking_user_app/view/screen_parent_bottom_navigation.dart';
import '../blocs/booking_bloc/booking_bloc.dart';
import '../blocs/date_checking_bloc/date_checking_bloc.dart';
import '../model/coupon_model.dart';
import '../resource/components/booking_page1_widget/coupon_apply_textfeild_widget.dart';
import '../resource/components/booking_page1_widget/date_selecting_widget.dart';
import '../resource/components/booking_page1_widget/guest_room_count_selection_widget.dart';
import '../resource/components/booking_page1_widget/top_image_room_details.dart';

class ScreenPayment extends StatefulWidget {
  const ScreenPayment({super.key, required this.data, required this.coupon});
  final RoomsModel data;
  final List<CouponModel> coupon;

  @override
  State<ScreenPayment> createState() => _ScreenPaymentState();
}

class _ScreenPaymentState extends State<ScreenPayment> {
  final TextEditingController couponController = TextEditingController();

  final TextEditingController mobNumberController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController dateController = TextEditingController();

  final ValueNotifier<int> guestNotifier = ValueNotifier(1);

  final ValueNotifier<int> roomNotifier = ValueNotifier(1);

  final GlobalKey<FormState> bookingFormKey = GlobalKey<FormState>();

  final ValueNotifier<int> totalPrice = ValueNotifier(0);

  final bool couponApplyCheck = false;

  bool bookingLoadingCheck = false;

  ValueNotifier<int> discountAmount = ValueNotifier(0);
  List<CouponModel> couponList = [];
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
                  const CustomTextWidget(
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
                data: widget.data,
                screenHeight: screenHeight,
              ),
              const SizedBox(
                height: 20,
              ),
              const CustomTextWidget(
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
                    data: widget.data,
                    notifier: guestNotifier,
                    text: 'Guest',
                    icon: Icons.person_outline_outlined),
              ),
              const SizedBox(
                height: 15,
              ),
              RoomGuestCountSelection(
                  guestOrRoomCheck: false,
                  data: widget.data,
                  notifier: roomNotifier,
                  text: 'Room',
                  icon: Icons.bed_outlined),
              const SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  const Expanded(
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
                          text: widget.data.propertyType,
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
                    child: ValueListenableBuilder(
                      valueListenable: discountAmount,
                      builder: (context, value, child) =>
                          CustomButtonForCouponApplyType(
                              text: 'Apply',
                              color: CustomColors.mainColor,
                              onPressedFunction: () {
                                couponList = widget.coupon
                                    .where((element) =>
                                        element.couponCode ==
                                        couponController.text)
                                    .toList();

                                if (couponList.isNotEmpty) {
                                  discountAmount.value = couponList[0].discount;
                                  // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
                                  discountAmount.notifyListeners();
                                  setState(() {});
                                }
                              }),
                    )),
              ]),
              const SizedBox(
                height: 30,
              ),
              PriceDetailsWidget(
                discoutAmount: discountAmount,
                totalPrice: totalPrice,
                numberOfRoomsNotifeir: roomNotifier,
                data: widget.data,
                dates: dateRangeNotifier,
              ),
              const SizedBox(
                height: 30,
              ),
              BlocConsumer<PaymentBloc, PaymentState>(
                listener: (context, state) {
                  if (state is PayementSuccessState) {
                    context.read<BookingBloc>().add(BookRoomEvent(
                        address: addressController.text,
                        dates: dateRangeNotifier.value,
                        data: widget.data,
                        mobNumber: mobNumberController.text,
                        guest: guestNotifier.value,
                        rooms: roomNotifier.value,
                        bookingsData: dateRangeNotifier.value,
                        startDate: dateRangeNotifier.value.start.toString(),
                        endDate: dateRangeNotifier.value.end.toString()));
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Room Booked Successfully'),
                      backgroundColor: CustomColors.greenColor,
                    ));
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => ScreenParentNavigation()));
                  } else if (state is PayementFailedState) {
                    bookingLoadingCheck = false;
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Payment Failed PleaseTry Again '),
                    ));
                  }
                },
                builder: (context, state) {
                  return BlocConsumer<BookingBloc, BookingState>(
                    listener: (context, state) {
                      if (state is BookingErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.errorMessage)));
                        bookingLoadingCheck = false;
                      }

                      if (state is BookingSuccessState) {
                        final token = SharedPrefModel.instance.getData('token');
                        context
                            .read<RoomsBloc>()
                            .add(FetchBookedRoomsEvent(token: token));
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content:
                                    Text('Payment Successfully Completed')));
                        bookingLoadingCheck = false;
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => ScreenParentNavigation()));
                      }
                    },
                    builder: (context, state) =>
                        BlocConsumer<CouponBloc, CouponState>(
                      listener: (context, state) {
                        if (state is CouponApplyLoadinState) {
                          bookingLoadingCheck = true;
                        } else if (state is CouponApplyFaliurState) {
                          couponList.clear();
                          bookingLoadingCheck = false;
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: Text(state.errorMessage),
                          ));
                        } else if (state is CouponApplySuccessState) {
                          context.read<DateCheckingBloc>().add(
                              GetAvailableDatesEventf(
                                  dateRangeNotifier.value.start.toString(),
                                  dateRangeNotifier.value.end.toString(),
                                  widget.data));
                        }
                      },
                      builder: (context, state) {
                        return BlocConsumer<DateCheckingBloc,
                            DateCheckingState>(
                          listener: (context, state) {
                            if (state is BookingDateNotAvailableState) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(state.errorMessage)));
                              bookingLoadingCheck = false;
                            }
                            if (state is DateAvailableCheckLoadingState) {
                              bookingLoadingCheck = true;
                            }
                            if (state is BookingDataAvailable) {
                              context.read<PaymentBloc>().add(PaymentStartEvent(
                                  mobNumber: mobNumberController.text,
                                  propertyName:
                                      widget.data.vendorId.propertyName,
                                  totalAmount: totalPrice.value.toString()));
                            }
                          },
                          builder: (context, state) => ButtonWidget(
                              loadingCheck: bookingLoadingCheck,
                              onpressFunction: () {
                                bookNowButtonFunction(context);
                              },
                              text: 'Book Now',
                              colorCheck: true),
                        );
                      },
                    ),
                  );
                },
              ),
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
      if (couponList.isNotEmpty) {
        context.read<CouponBloc>().add(
            ApplyCouponEvent(couponList[0].couponCode, couponList[0].vendorId));
      } else {
        context.read<DateCheckingBloc>().add(GetAvailableDatesEventf(
            dateRangeNotifier.value.start.toString(),
            dateRangeNotifier.value.end.toString(),
            widget.data));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Fill all fields')));
    }
  }
}
