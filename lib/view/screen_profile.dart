import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/blocs/rooms_bloc/rooms_bloc.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import '../blocs/user_bloc/user_bloc.dart';
import '../const/custom_colors.dart';
import '../resource/components/profile_widgets/listtile_widget.dart';

class ScreenProfile extends StatelessWidget {
  const ScreenProfile({super.key});

  @override
  Widget build(BuildContext context) {
    double heightMidia = MediaQuery.sizeOf(context).height;
    double widhtMidia = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: heightMidia * 0.23,
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
                              SizedBox(
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
                                    onTap: () {},
                                    child: CustomTextWidget(
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
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal),
                            ],
                          );
                        }
                        return const SizedBox();
                      },
                    ),
                  ),
                  // Positioned(
                  //   bottom: heightMidia * 0.1,
                  //   right: 0,
                  //   left: 0,
                  //   child: Container(
                  //     //  color: Colors.red,
                  //     // height: heightMidia * 0.12,
                  //     decoration: const BoxDecoration(
                  //         image: DecorationImage(
                  //             image: AssetImage(
                  //                 'lib/asset/image/profile_background_img.png'),
                  //             fit: BoxFit.fill)),
                  //   ),
                  // ),
                  // Positioned(
                  //   bottom: heightMidia * 0.04,
                  //   left: widhtMidia * 0.07,
                  //   // width: 100,
                  //   // child: ClipRRect(
                  //   //   borderRadius: BorderRadius.circular(7),
                  //   //   child: Container(
                  //   //     decoration: BoxDecoration(
                  //   //         color: Colors.yellow,
                  //   //         borderRadius: BorderRadius.circular(7)),
                  //   //     width: widhtMidia * 0.25,
                  //   //     height: heightMidia * 0.115,
                  //   //   ),
                  //   // ),
                  // ),
                  // Positioned(
                  //     bottom: heightMidia * 0.04,
                  //     left: widhtMidia * 0.37,
                  //     child: SizedBox(
                  //       width: widhtMidia * 0.4,
                  //       height: heightMidia * 0.038,
                  //       child: ElevatedButton(
                  //           onPressed: () async {},
                  //           style: ButtonStyle(
                  //               elevation: MaterialStateProperty.all(0),
                  //               backgroundColor: MaterialStateProperty.all(
                  //                   CustomColors.mainColor)),
                  //           child: CustomTextWidget(
                  //               text: 'Edit Profile',
                  //               color: Colors.white,
                  //               fontSize: 12,
                  //               fontWeight: FontWeight.w600)),
                  //     )),
                  Positioned(
                      bottom: heightMidia * 0.0,
                      right: 0,
                      left: 0,
                      child: Container(
                        height: heightMidia * 0.02,
                        color: CustomColors.extraLightGrey,
                      )),
                ],
              ),
            ),
            ProfileListTileWidget(),
          ],
        ),
      ),
    );
  }
}
