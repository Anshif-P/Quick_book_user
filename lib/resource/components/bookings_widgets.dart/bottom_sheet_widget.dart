import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/resource/components/rating_widgets/start_widget.dart';
import '../../../blocs/review_bloc/review_bloc.dart';
import '../../../const/custom_colors.dart';
import '../../../data/shared_preferences/shared_pref_model.dart';
import '../../../model/booked_rooms_model.dart';
import '../../../utils/validation.dart';
import '../comman/button_widget.dart';
import '../comman/textfeild.dart';

class BottomSheetWidget extends StatelessWidget {
  BottomSheetWidget(
      {Key? key,
      this.reviewController,
      required this.data,
      required this.homeContext})
      : super(key: key);
  final TextEditingController? reviewController;
  final BookedRoomModel data;
  final ValueNotifier<double> rating = ValueNotifier<double>(0);
  final GlobalKey<FormState> ratingFormKey = GlobalKey<FormState>();
  bool loadingCheck = false;
  final BuildContext homeContext;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AddStarsWidget(
              data: data,
              rating: rating,
            ),
            TextFieldWidget(
              text: 'Write a Review',
              hintText: 'How is the room, write your experience',
              controller: reviewController!,
              icon: Icons.rate_review_sharp,
              validator: (value) => Validations.emtyValidation(value),
            ),
            SizedBox(height: 16),
            BlocConsumer<ReviewBloc, ReviewState>(
              listener: (context, state) {
                if (state is ReviewAddLoadingState) {
                  loadingCheck = true;
                }
                if (state is ReviewAddedErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.erroMessage),
                    backgroundColor: CustomColors.mainColor,
                  ));
                  Navigator.of(context).pop();
                } else if (state is ReviewAddedSuccessState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text('Review added successfully'),
                      backgroundColor: CustomColors.greenColor,
                    ),
                  );
                  Navigator.of(context).pop();
                }
              },
              builder: (context, state) {
                return ValueListenableBuilder(
                  valueListenable: rating,
                  builder: (context, value, child) => ButtonWidget(
                    loadingCheck: loadingCheck,
                    reviewButtonCheck: true,
                    onpressFunction: () {
                      print('=========================on press fun');

                      if (value == 0.0) {
                        print(value);
                        print(
                            'eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeiiiiiiiiiiiiiiiiiiiiiiiii');
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Add Rating')));
                      } else {
                        print('else ----------------case');
                        Map<String, dynamic> map = {
                          "roomId": data.roomId.id,
                          "feedback": reviewController!.text,
                          "stars": value,
                          "vendorId": data.vendorId.id
                        };
                        print(map);
                        final token = SharedPrefModel.instance.getData('token');
                        context
                            .read<ReviewBloc>()
                            .add(AddRoomReviewEvent(map: map, token: token));
                      }
                    },
                    text: 'Submit',
                    colorCheck: true,
                    paymentButtonCheck: true,
                  ),
                );
              },
            ),
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              height: MediaQuery.of(context).viewInsets.bottom,
            )
          ],
        ),
      ),
    );
  }
}
