import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import 'package:hotel_booking_user_app/view/screen_edit_profile.dart';
import '../blocs/home_bloc/home_bloc.dart';
import '../blocs/user_bloc/user_bloc.dart';

import '../model/room_model.dart';
import '../resource/components/profile_widgets/listtile_widget.dart';

// ignore: must_be_immutable
class ScreenProfile extends StatelessWidget {
  ScreenProfile({super.key});
  List<RoomsModel>? data;

  @override
  Widget build(BuildContext context) {
    double heightMidia = MediaQuery.sizeOf(context).height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: heightMidia * 0.20,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                          'lib/asset/image/profile_background_img.png'),
                      fit: BoxFit.fill)),
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: BlocBuilder<UserBloc, UserState>(
                      builder: (context, state) {
                        if (state is UserDataFetchSuccessState) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CustomTextWidget(
                                      text:
                                          state.userDetails.name.toUpperCase(),
                                      color: Colors.white,
                                      fontSize: 22,
                                      fontWeight: FontWeight.w700),
                                  InkWell(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => ScreenEdit(
                                            userDetails: state.userDetails),
                                      ));
                                    },
                                    child: const CustomTextWidget(
                                        text: 'Edit Profile',
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                              CustomTextWidget(
                                  text: state.userDetails.email,
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.normal),
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  // Positioned(
                  //     bottom: heightMidia * 0.0,
                  //     right: 0,
                  //     left: 0,
                  //     child: Container(
                  //       height: heightMidia * 0.02,
                  //       color: CustomColors.extraLightGrey,
                  //     )),
                ],
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeFetchRoomsSuccessState) {
                  data = state.totalRoomList;

                  return ProfileListTileWidget(data: data);
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }
}
