import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/review_bloc/review_bloc.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/view/screen_room_details.dart';
import 'package:shimmer/shimmer.dart';

import '../../../blocs/coupon_bloc/coupon_bloc.dart';
import '../../../blocs/home_bloc/home_bloc.dart';
import '../comman/location_home_widget.dart';

class HomeCardWidget extends StatelessWidget {
  const HomeCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomeFetchRoomsSuccessState) {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 20,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: state.totalRoomList.length,
            itemBuilder: (context, index) {
              final data = state.totalRoomList[index];
              return InkWell(
                onTap: () {
                  final token = SharedPrefModel.instance.getData('token');
                  context.read<CouponBloc>().add(GetRoomCouponsEvent(
                      vendorId: data.vendorId.id, token: token));
                  context.read<ReviewBloc>().add(GetRoomReviews(
                        roomId: data.id,
                        token: token,
                      ));
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ScreenRoomDetails(
                            data: data,
                          )));
                },
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 5,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8)),
                          child: CachedNetworkImage(
                            width: 300,
                            fit: BoxFit.cover,
                            imageUrl: data.img[0],
                            placeholder: (context, url) => Shimmer.fromColors(
                              baseColor: Colors.grey.shade300,
                              highlightColor: Colors.grey.shade100,
                              child: Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(data.img[0]),
                                        fit: BoxFit.cover),
                                    color: Colors.grey,
                                    borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(8),
                                        topRight: Radius.circular(8))),
                                height: 150,
                                width: 300,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          width: 300,
                          decoration: const BoxDecoration(
                            color: CustomColors.textFeildIconColor,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(5),
                                bottomRight: Radius.circular(5)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                CustomTextWidget(
                                    text: data.vendorId.propertyName,
                                    color: CustomColors.blackColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    LocationHomeWidget(
                                        text1: data.state, text2: data.city),
                                    CustomTextWidget(
                                        text: '₹${data.price}',
                                        color: CustomColors.blackColor,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600)
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
              );
            },
          );
        }
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            flex: 5,
            child: Container(
              decoration: const BoxDecoration(
                  color: CustomColors.textFeildIconColor,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8))),
              // height: 150,
              width: 300,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 300,
              decoration: const BoxDecoration(
                color: CustomColors.grey,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(5),
                    bottomRight: Radius.circular(5)),
              ),
              child: const Padding(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(
                        text: 'No Rooms Found',
                        color: CustomColors.blackColor,
                        fontSize: 13,
                        fontWeight: FontWeight.w600),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LocationHomeWidget(text1: ',', text2: ''),
                        CustomTextWidget(
                            text: '',
                            color: CustomColors.blackColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ]);
      },
    );
  }
}
