import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'checkin_text_widget.dart';

class CheckInCheckOutWidget extends StatelessWidget {
  const CheckInCheckOutWidget(
      {super.key,
      required this.heightMedia,
      required this.widthMedia,
      required this.checkInData,
      required this.checkOutData});
  final double heightMedia;
  final double widthMedia;
  final String checkInData;
  final String checkOutData;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BookingDetailsTextWidget(
              text: 'Check-in',
              sizeCheck: true,
            ),
            SizedBox(
              height: heightMedia * 0.015,
            ),
            Text(
              checkInData,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              )),
            ),
          ],
        ),
        //===========//
        SizedBox(
          //color: Colors.yellow,
          width: 20,
          height: heightMedia * 0.056,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 1,
                height: heightMedia * 0.056,
                color: const Color(0xFFD1D1D1),
              ),
              Positioned(
                child: Container(
                  alignment: Alignment.center,
                  width: 15,
                  height: 7,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF2F2F2),
                      borderRadius: BorderRadius.circular(2)),
                  child: Text(
                    '2N',
                    style: GoogleFonts.inter(
                        textStyle: const TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                      fontSize: 5,
                    )),
                  ),
                ),
              ),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const BookingDetailsTextWidget(
              text: 'Check-Out',
              sizeCheck: true,
            ),
            SizedBox(
              height: heightMedia * 0.015,
            ),
            Text(
              checkOutData,
              style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 12,
              )),
            ),
          ],
        ),
      ],
    );
  }
}
