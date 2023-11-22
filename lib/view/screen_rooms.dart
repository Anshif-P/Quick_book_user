import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/review_bloc/review_bloc.dart';
import 'package:hotel_booking_user_app/const/custom_colors.dart';
import 'package:hotel_booking_user_app/data/shared_preferences/shared_pref_model.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/search_textfeild_widget.dart';
import 'package:hotel_booking_user_app/resource/components/rooms_widget/search_filter.dart';
import 'package:hotel_booking_user_app/view/screen_room_details.dart';
import '../blocs/home_bloc/home_bloc.dart';
import '../model/room_model.dart';
import '../resource/components/rooms_widget/rooms_card_widget.dart';

class ScreenRooms extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  ScreenRooms(
      {super.key,
      this.allRoomsOrCategorizedRoomCheck = false,
      this.categorizedRooms});
  bool allRoomsOrCategorizedRoomCheck;
  List<RoomsModel>? categorizedRooms;

  @override
  Widget build(BuildContext context) {
    double screenHeightTemp = MediaQuery.sizeOf(context).height;
    double safeAreaSize = MediaQuery.of(context).padding.top;
    double screenHeight = screenHeightTemp - safeAreaSize;
    // double screenWidth = MediaQuery.sizeOf(context).width;
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
                              child: Icon(Icons.arrow_back)),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: CustomTextWidget(
                            text: categorizedRooms![0].category,
                            color: CustomColors.blackColor,
                            fontSize: 23,
                            fontWeight: FontWeight.w600),
                      ),
                      const Expanded(flex: 1, child: SizedBox())
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                          flex: 6,
                          child: SearchTextFeildWidget(
                              controller: searchController)),
                      SizedBox(
                        width: 16,
                      ),
                      Expanded(flex: 1, child: FilterWidget())
                    ],
                  ),
          ),
          SizedBox(
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

                      return InkWell(
                        onTap: () async {
                          final token =
                              await SharedPrefModel.instance.getData('token');
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
                            SizedBox(
                              height: 20,
                            ),
                            RoomsCardWidget(
                              data: data,
                            )
                          ],
                        ),
                      );
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
                                SizedBox(
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
