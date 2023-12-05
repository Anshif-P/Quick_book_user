import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/resource/components/comman/search_textfeild_widget.dart';
import 'package:hotel_booking_user_app/view/screen_room_details.dart';

import '../blocs/search_bloc/search_bloc.dart';
import '../model/room_model.dart';
import '../resource/components/comman/comman_text_widget.dart';
import '../resource/components/rooms_widget/rooms_card_widget.dart';
import '../resource/components/rooms_widget/search_filter.dart';
import '../resource/components/search_widgets.dart/search_filter_widget.dart';
import '../resource/const/custom_colors.dart';

class ScreenSearchRooms extends StatelessWidget {
  ScreenSearchRooms({Key? key, required this.totalRooms}) : super(key: key);
  final List<RoomsModel> totalRooms;

  final TextEditingController searchController = TextEditingController();

  ValueNotifier<List<String>> amentiesList = ValueNotifier([]);

  ValueNotifier<bool> containerVisiblity = ValueNotifier(false);
  ValueNotifier<String> queryNotifier = ValueNotifier('');

  ValueNotifier<double> selectedPrice = ValueNotifier(15000);

  List<RoomsModel>? filteredRooms;

  // final List<String> items = ['Ac', 'Swimming Pool', 'Meeting Room', 'Wifi'];

  ValueNotifier<List<RoomsModel>> filteredListNotifier = ValueNotifier([]);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          alignment: Alignment.centerLeft,
                          child: InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Icon(Icons.arrow_back)),
                        ),
                      ),
                      const Expanded(
                        flex: 3,
                        child: CustomTextWidget(
                            text: 'Discover your rooms',
                            color: CustomColors.blackColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 6,
                          child: SearchTextFeildWidget(
                              notEditableCheck: false,
                              controller: searchController,
                              onChanged: (value) {
                                queryNotifier.value = value;
                                context.read<SearchBloc>().add(SearchHotelEvent(
                                    query: value,
                                    amentiesList: amentiesList.value,
                                    priceRange: selectedPrice.value));
                              })),
                      const SizedBox(
                        width: 16,
                      ),
                      Expanded(
                          flex: 1,
                          child: InkWell(
                              onTap: () {
                                containerVisiblity.value =
                                    !containerVisiblity.value;
                                containerVisiblity.notifyListeners();
                              },
                              child: const FilterWidget()))
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                SearchFilterWidget(
                  queryNotifier: queryNotifier,
                  selectedPrice: selectedPrice,
                  filterResult: filteredListNotifier,
                  ametiesList: amentiesList,
                  containerVisiblity: containerVisiblity,
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
            Container(
              height: 0.6,
              color: CustomColors.lightGreyColor,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: BlocBuilder<SearchBloc, SearchState>(
                  builder: (context, state) {
                    if (state is SearchFoundState) {
                      return ListView.separated(
                        separatorBuilder: (context, index) => const SizedBox(
                          height: 0,
                        ),
                        itemBuilder: (context, index) {
                          final data = state.filteredRooms[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) =>
                                      ScreenRoomDetails(data: data)));
                            },
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                RoomsCardWidget(
                                  data: data,
                                )
                              ],
                            ),
                          );
                        },
                        itemCount: state.filteredRooms.length,
                      );
                    }
                    if (state is SearchNotFoundState) {
                      print(
                          'heloowwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
                      const Center(
                        child: Text('Room Not Found'),
                      );
                    }
                    return const SizedBox();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//  void filterRooms(String value) {
//     // if (amentiesList.value.isNotEmpty) {
//     //   filteredListNotifier.value = filteredListNotifier.value.where((e) {
//     //     for (int i = 0; i < amentiesList.value.length; i++) {
//     //       double price = double.parse(e.price);
//     //       if (e.amenities.contains(amentiesList.value[i]) &&
//     //           price <= selectedPrice.value) {
//     //         return true;
//     //       }
//     //     }
//     //     return false;
//     //   }).toList();

//     //   print(filteredListNotifier);
//     //   setState(() {});
//     // }

//     filteredListNotifier.value = widget.totalRooms
//         .where((e) => e.state.toLowerCase().contains(value.toLowerCase()))
//         .toList();
//     filteredListNotifier.notifyListeners();

//     setState(() {});
//   }