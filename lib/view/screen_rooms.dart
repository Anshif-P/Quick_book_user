import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/coupon_bloc/coupon_bloc.dart';
import 'package:hotel_booking_user_app/blocs/review_bloc/review_bloc.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/search_textfeild_widget.dart';
import 'package:hotel_booking_user_app/resource/components/rooms_widget/search_filter.dart';
import 'package:hotel_booking_user_app/view/screen_room_details.dart';
import 'package:hotel_booking_user_app/view/screen_search_rooms.dart';
import '../blocs/home_bloc/home_bloc.dart';
import '../blocs/search_bloc/search_bloc.dart';
import '../model/room_model.dart';
import '../resource/components/rooms_widget/rooms_card_widget.dart';

// ignore: must_be_immutable
class ScreenRooms extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  ScreenRooms(
      {super.key,
      this.allRoomsOrCategorizedRoomCheck = false,
      this.categorizedRooms,
      this.headingCheckForWishlist = false});
  bool allRoomsOrCategorizedRoomCheck;
  List<RoomsModel>? categorizedRooms;
  bool headingCheckForWishlist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: allRoomsOrCategorizedRoomCheck
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Icon(Icons.arrow_back)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomTextWidget(
                            text: headingCheckForWishlist
                                ? 'WishList'
                                : categorizedRooms![0].category,
                            color: CustomColors.blackColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w600),
                      ),
                      const Expanded(flex: 1, child: SizedBox())
                    ],
                  )
                : BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeFetchRoomsSuccessState) {
                        return InkWell(
                          onTap: () {
                            context.read<SearchBloc>().add(SearchHotelEvent(
                                priceRange: null,
                                query: null,
                                amentiesList: []));
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ScreenSearchRooms(
                                      totalRooms: state.totalRoomList,
                                    )));
                          },
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 6,
                                  child: SearchTextFeildWidget(
                                      controller: searchController)),
                              const SizedBox(
                                width: 16,
                              ),
                              const Expanded(flex: 1, child: FilterWidget())
                            ],
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
          ),
          const SizedBox(
            height: 8,
          ),
          Container(
            height: 0.6,
            color: CustomColors.lightGreyColor,
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: allRoomsOrCategorizedRoomCheck
                ? ListView.builder(
                    itemCount: categorizedRooms!.length,
                    itemBuilder: (context, index) {
                      final data = categorizedRooms![index];
                      if (categorizedRooms!.isNotEmpty) {
                        return InkWell(
                          onTap: () {
                            final token =
                                SharedPrefModel.instance.getData('token');
                            context.read<CouponBloc>().add(GetRoomCouponsEvent(
                                vendorId: data.vendorId.id, token: token));
                            context.read<ReviewBloc>().add(GetRoomReviews(
                                  roomId: data.id,
                                  token: token,
                                ));
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) =>
                                    ScreenRoomDetails(data: data)));
                          },
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              RoomsCardWidget(
                                data: data,
                              )
                            ],
                          ),
                        );
                      } else {
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Text('No Rooms Found')],
                        );
                      }
                    },
                  )
                : BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
                    if (state is HomeFetchRoomsSuccessState &&
                        state.totalRoomList.isNotEmpty) {
                      return ListView.builder(
                        itemCount: state.totalRoomList.length,
                        itemBuilder: (context, index) {
                          final data = state.totalRoomList[index];

                          return InkWell(
                            onTap: () async {
                              final token = await SharedPrefModel.instance
                                  .getData('token');
                              // ignore: use_build_context_synchronously
                              context.read<CouponBloc>().add(
                                  GetRoomCouponsEvent(
                                      vendorId: data.vendorId.id,
                                      token: token));
                              // ignore: use_build_context_synchronously
                              context.read<ReviewBloc>().add(GetRoomReviews(
                                    roomId: data.id,
                                    token: token,
                                  ));

                              // ignore: use_build_context_synchronously
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ScreenRoomDetails(data: data)));
                            },
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                RoomsCardWidget(
                                  data: data,
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                    return const Center(child: Text('No Rooms fount'));
                  }),
          ))
        ],
      )),
    );
  }
}
