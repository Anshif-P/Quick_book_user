import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/const/custom_colors.dart';
import 'package:hotel_booking_user_app/resource/components/comman/comman_text_widget.dart';
import '../bookings_widgets.dart/booking_text_widget.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DateSelectionWidget extends StatefulWidget {
  DateSelectionWidget({super.key, required this.dateRange});
  ValueNotifier<DateTimeRange> dateRange;

  @override
  State<DateSelectionWidget> createState() => _DateSelectionWidgetState();
}

class _DateSelectionWidgetState extends State<DateSelectionWidget> {
  @override
  Widget build(BuildContext context) {
    final start = widget.dateRange.value.start;
    final end = widget.dateRange.value.end;
    return InkWell(
      onTap: () => pickDateRange(context),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomTextWidget(
              text: 'Select Dates',
              color: CustomColors.blackColor,
              fontSize: 14,
              fontWeight: FontWeight.normal),
          const SizedBox(
            height: 5,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                border:
                    Border.all(color: CustomColors.lightGreyColor, width: 1),
                //  color: Colors.red,
                borderRadius: BorderRadius.circular(8)),
            height: 50,
            child: Row(children: [
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                      // color: Colors.green,
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(8),
                          topLeft: Radius.circular(8))),
                  child: const Row(children: [
                    Icon(
                      Icons.date_range_outlined,
                      weight: 1,
                      color: CustomColors.lightGreyColor,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    CustomTextWidget(
                        text: 'Date',
                        color: CustomColors.blackColor,
                        fontSize: 13,
                        fontWeight: FontWeight.normal)
                  ]),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    //  color: Colors.blue,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      BookingTextWidget(
                        fontSizeCheck: true,
                        text1: DateFormat('EEE, d MMM -').format(start),
                        text2: DateFormat('EEE, d MMM').format(end),
                      ),
                    ],
                  ),
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }

  Future pickDateRange(BuildContext context) async {
    DateTimeRange? newDateRange = await showDateRangePicker(
        context: context,
        initialDateRange: widget.dateRange.value,
        firstDate: DateTime.now(),
        lastDate: DateTime(2100));
    if (newDateRange == null) return;
    setState(() {
      widget.dateRange.value = newDateRange;
      // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
      widget.dateRange.notifyListeners();
    });
  }
}



// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:hotel_booking_user_app/const/custom_colors.dart';
// import 'package:hotel_booking_user_app/widget/comman/comman_text_widget.dart';

// class DateSelectionWidget extends StatelessWidget {
//   final TextEditingController controller = TextEditingController();

//   final FormFieldValidator validator;

//   DateSelectionWidget({
//     super.key,
//     required this.validator,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Text(''),
//         // const SizedBox(
//         //   height: 5,
//         // ),
//         SizedBox(
//           child: TextFormField(
//             onEditingComplete: () {},
//             validator: validator,
//             controller: controller,
//             decoration: InputDecoration(
//               prefix: Row(
//                 children: [
//                   Row(
//                     children: [
//                       Icon(
//                         Icons.date_range_outlined,
//                         color: Colors.black,
//                       ),
//                       SizedBox(
//                         width: 5,
//                       ),
//                       CustomTextWidget(
//                           text: 'Date',
//                           color: CustomColors.blackColor,
//                           fontSize: 13,
//                           fontWeight: FontWeight.normal),
//                     ],
//                   ),
//                 ],
//               ),
//               hintText: 'Wed,8 Nov - Fri, 10 Nov',
//               isDense: true,
//               constraints: const BoxConstraints(maxHeight: 70, minHeight: 35),
//               focusedErrorBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(
//                     color: Colors.red), // Set the border color when focused
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(
//                     color:
//                         Color(0xFFD1D1D1)), // Set the border color when focused
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               enabledBorder: OutlineInputBorder(
//                 borderSide: const BorderSide(
//                     color: Color(
//                         0xFFD1D1D1)), // Set the border color when not focused
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               contentPadding:
//                   const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
//               hintStyle: TextStyle(color: CustomColors.blueColor),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
