import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/blocs/search_bloc/search_bloc.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/resource/components/comman/search_textfeild_widget.dart';
import 'package:hotel_booking_user_app/resource/components/home_room_widget/home_card_widget.dart';
import 'package:hotel_booking_user_app/resource/components/rooms_widget/search_filter.dart';
import 'package:hotel_booking_user_app/view/screen_drawer.dart';
import 'package:hotel_booking_user_app/view/screen_search_rooms.dart';
import '../blocs/home_bloc/home_bloc.dart';
import '../blocs/user_bloc/user_bloc.dart';
import '../resource/components/home_room_widget/top_category_card_widget.dart';

class ScreenHome extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      drawer: Drawer(child: ScreenDrawer()),
      body: SafeArea(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Builder(builder: (context) {
                          return InkWell(
                            onTap: () => Scaffold.of(context).openDrawer(),
                            child: const Icon(
                              Icons.sort,
                              size: 40,
                            ),
                          );
                        }),
                        Text('qb',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    color: CustomColors.mainColor,
                                    fontSize: 45,
                                    fontWeight: FontWeight.bold)))
                      ]),
                  const SizedBox(
                    height: 30,
                  ),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (context, state) {
                      if (state is UserDataFetchSuccessState) {
                        return CustomTextWidget(
                            text: 'Hello,${state.userDetails.name}',
                            color: CustomColors.blackColor,
                            fontSize: 15,
                            fontWeight: FontWeight.normal);
                      }
                      return const SizedBox();
                    },
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const CustomTextWidget(
                      text: "Let's find the best stay",
                      color: CustomColors.blackColor,
                      fontSize: 19,
                      fontWeight: FontWeight.w600),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<HomeBloc, HomeState>(
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
                                  flex: 5,
                                  child: SearchTextFeildWidget(
                                      notEditableCheck: true,
                                      controller: searchController)),
                              const SizedBox(
                                width: 20,
                              ),
                              const Expanded(flex: 1, child: FilterWidget())
                            ],
                          ),
                        );
                      }
                      return const SizedBox();
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const CustomTextWidget(
                      text: "Brows your rooms",
                      color: CustomColors.blackColor,
                      fontSize: 19,
                      fontWeight: FontWeight.w600),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Container(
                  height: 200,
                  width: double.maxFinite,
                  decoration: const BoxDecoration(
                    //  color: Colors.yellow,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        bottomLeft: Radius.circular(5)),
                  ),
                  child: const HomeCardWidget()),
            ),
            const SizedBox(
              height: 25,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: CustomTextWidget(
                  text: "Top category",
                  color: CustomColors.blackColor,
                  fontSize: 19,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 25,
            ),
            BlocListener<HomeBloc, HomeState>(
              listener: (context, state) {
                if (state is HomeFetchErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.errorMessage),
                    backgroundColor: CustomColors.mainColor,
                  ));
                }
              },
              child: Container(
                alignment: Alignment.center,
                color: CustomColors.textFeildIconColor,
                child: CategoryCardWidget(),
              ),
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
