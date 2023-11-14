import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:hotel_booking_user_app/resource/components/comman/button_widget.dart';
import '../resource/components/signup_login_widgets/divider_widget.dart';
import '../resource/components/signup_login_widgets/mobileno_textfeild.dart';

class ScreenMobileNumber extends StatefulWidget {
  ScreenMobileNumber({super.key});
  TextEditingController numberController = TextEditingController();

  @override
  State<ScreenMobileNumber> createState() => _ScreenMobileNumberState();
}

class _ScreenMobileNumberState extends State<ScreenMobileNumber> {
  CountryCode? _selectedCountry;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  constraints: const BoxConstraints(minHeight: 400),
                  height: screenHeight * 0.55,
                  //   color: Colors.red,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            'qb',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                                    color: Color(0xFFCB102F),
                                    fontSize: 76,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            width: screenWidth * 0.03,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      SvgPicture.asset(
                          'lib/asset/image/undraw_my_password_re_ydq7 1.svg',
                          height: 150),
                      SizedBox(
                        height: screenHeight * 0.144,
                      ),
                      MobileNoTextField(
                          contextMainScreen: context,
                          validation: (value) {},
                          controller: widget.numberController),
                    ],
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(minHeight: 400),
                  //  color: Colors.amber,
                  height: screenHeight * 0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.04,
                      ),
                      ButtonWidget(
                        text: 'Continue',
                        colorCheck: true,
                        onpressFunction: () {},
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      const DividerWidget(),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      ButtonWidget(
                        text: 'Log In',
                        colorCheck: false,
                        borderCheck: true,
                        onpressFunction: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/////////////////////////---------------------------------------------/////////////