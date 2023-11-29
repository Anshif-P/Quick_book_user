import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/button_widget.dart';

class ScreenOtp extends StatefulWidget {
  const ScreenOtp({super.key});

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<ScreenOtp> {
  final List<FocusNode> _focusNodes = List.generate(4, (index) => FocusNode());
  final List<TextEditingController> _controllers =
      List.generate(4, (index) => TextEditingController());

  @override
  void initState() {
    super.initState();
    _focusNodes[0].requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    double screenSafeareaHeight = MediaQuery.of(context).padding.top;
    double screenHeightTemp = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = screenHeightTemp - screenSafeareaHeight;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  //  color: Colors.red,
                  height: screenHeight * 0.8,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: screenHeight * 0.08,
                      ),
                      Text(
                        'Verify with OTP',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                        )),
                      ),
                      const SizedBox(
                        height: 7,
                      ),
                      Text(
                        'sent via SMS to 7356951234',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                          color: Color(0xFF777777),
                          fontSize: 11,
                        )),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      Row(
                        children: List.generate(
                          4,
                          (index) => Container(
                            margin: const EdgeInsets.only(
                                right: 10), // Adjust the horizontal margin
                            child: SizedBox(
                              width: screenWidth * 0.11,
                              height: 59,
                              child: TextFormField(
                                controller: _controllers[index],
                                focusNode: _focusNodes[index],
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 24),
                                onChanged: (value) {
                                  if (value.isNotEmpty) {
                                    if (index < 3) {
                                      _focusNodes[index + 1].requestFocus();
                                    } else {
                                      // All OTP fields are filled
                                      String otp = '';
                                      for (var controller in _controllers) {
                                        otp += controller.text;
                                      }
                                    }
                                  } else if (index > 0) {
                                    _focusNodes[index - 1].requestFocus();
                                  }
                                },
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFD1D1D1)),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        color: Color(0xFFD1D1D1)),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      Row(
                        children: [
                          Text(
                            'Login in using',
                            style: GoogleFonts.inter(
                                textStyle: const TextStyle(
                              color: Color(0xFF777777),
                              fontSize: 11,
                            )),
                          ),
                          Text(
                            ' Password',
                            style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    color: CustomColors.mainColor,
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.26),
                    ],
                  ),
                ),
                Container(
                  constraints: const BoxConstraints(minHeight: 150),
                  // color: Colors.yellow,
                  height: screenHeight * 0.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ButtonWidget(
                        text: 'Submit',
                        colorCheck: true,
                        onpressFunction: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    for (var node in _focusNodes) {
      node.dispose();
    }
    super.dispose();
  }
}
