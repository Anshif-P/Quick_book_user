import 'package:flutter/material.dart';
import 'package:hotel_booking_user_app/resource/components/comman/search_textfeild_widget.dart';
import 'package:hotel_booking_user_app/view/screen_room_details.dart';
import '../data/shared_preferences/shared_pref_model.dart';
import '../model/room_model.dart';
import '../resource/components/comman/comman_text_widget.dart';
import '../resource/components/rooms_widget/rooms_card_widget.dart';
import '../resource/components/rooms_widget/search_filter.dart';
import '../resource/components/search_widgets.dart/search_filter_widget.dart';
import '../resource/const/custom_colors.dart';

class ScreenSearchRooms extends StatefulWidget {
  ScreenSearchRooms({Key? key, required this.totalRooms}) : super(key: key);
  final List<RoomsModel> totalRooms;

  @override
  State<ScreenSearchRooms> createState() => _ScreenSearchRoomsState();
}

class _ScreenSearchRoomsState extends State<ScreenSearchRooms> {
  final TextEditingController searchController = TextEditingController();

  ValueNotifier<List<bool>> amentiesList =
      ValueNotifier<List<bool>>([false, false, false, false]);

  ValueNotifier<bool> containerVisiblity = ValueNotifier(false);

  ValueNotifier<double> selectedPrice = ValueNotifier(500);

  List<RoomsModel>? filteredRooms;

  ValueNotifier<bool> searchFilterEnableCheck = ValueNotifier(false);

  final List<String> items = ['Ac', 'Swimming Pool', 'Meeting Room', 'Wifi'];

  List<RoomsModel>? filteredList;

  @override
  void initState() {
    super.initState();
    filteredList = widget.totalRooms;
  }

  void filterRooms(bool value) {
    filteredList = widget.totalRooms
        .where((room) =>
            room.vendorId.propertyName
                .toLowerCase()
                .contains(searchController.text.toLowerCase()) &&
            (value
                ? int.parse(room.totalRoomRate) <= selectedPrice.value &&
                    room.amenities.any((element) =>
                        items.contains(element) &&
                        amentiesList.value[items.indexOf(element)])
                : true))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  Row(
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
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 6,
                          child: ValueListenableBuilder(
                            valueListenable: searchFilterEnableCheck,
                            builder: (context, value, child) =>
                                SearchTextFeildWidget(
                                    notEditableCheck: false,
                                    controller: searchController,
                                    onChanged: (value) {
                                      filterRooms(
                                          searchFilterEnableCheck.value);
                                    }),
                          )),
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
                              child: FilterWidget()))
                    ],
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SearchFilterWidget(
                    searchFilterEnableCheck: searchFilterEnableCheck,
                    intialPrice: selectedPrice,
                    ametiesList: amentiesList,
                    containerVisiblity: containerVisiblity,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            Container(
              height: 0.6,
              color: CustomColors.lightGreyColor,
            ),
            Expanded(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ListView.separated(
                    separatorBuilder: (context, index) => SizedBox(
                      height: 0,
                    ),
                    itemBuilder: (context, index) {
                      final data = filteredList![index];
                      return InkWell(
                        onTap: () async {
                          final token =
                              await SharedPrefModel.instance.getData('token');
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
                    itemCount: filteredList?.length ?? 0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
