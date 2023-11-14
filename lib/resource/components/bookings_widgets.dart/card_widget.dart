import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotel_booking_user_app/resource/components/comman/card_text_widget.dart';

import '../../../const/custom_colors.dart';
import '../comman/location_text_widget.dart';
import 'booking_text_widget.dart';

class BookingCardWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  final String text;
  const BookingCardWidget(
      {super.key,
      required this.heightMedia,
      required this.widthMedia,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(

          //    color: Colors.yellow,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: CustomColors.lightGreyColor)),
      height: heightMedia * 0.15,
      child: Row(
        children: [
          Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.red,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(13)),
                  ),
                ),
              )),
          Expanded(
              flex: 4,
              child: Container(
                //  color: Colors.yellow,
                child: const Padding(
                  padding: EdgeInsets.only(top: 17),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CardsHeadingTextWidget(text: 'Galaxy Hotel'),
                      SizedBox(
                        height: 4,
                      ),
                      LocationTextWidget(
                        text1: 'Kerala',
                        text2: 'India',
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      BookingTextWidget(
                          text1: 'Web 8 Nov -', text2: 'Fri 10 Now'),
                      SizedBox(
                        height: 5,
                      ),
                      BookingTextWidget(text1: 'Room 1,', text2: 'Adult 2'),
                    ],
                  ),
                ),
              )),
          Expanded(
            flex: 2,
            child: Container(
              //   color: Colors.green,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                        minimumSize:
                            MaterialStateProperty.all(const Size(10, 25)),
                        backgroundColor:
                            MaterialStateProperty.all(CustomColors.mainColor),
                      ),
                      onPressed: () {},
                      child: Text(
                        'View',
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 9,
                        )),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
