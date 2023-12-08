import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RoomDetailsImagesWidget extends StatelessWidget {
  final double widthMedia;
  final double heightMedia;
  final List imageList;
  final ValueNotifier<int> selecteImageNotifier;

  const RoomDetailsImagesWidget({
    super.key,
    required this.imageList,
    required this.selecteImageNotifier,
    required this.heightMedia,
    required this.widthMedia,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: selecteImageNotifier,
      builder: (context, value, child) => GridView.builder(
        padding: const EdgeInsets.all(0),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 40,
        ),
        itemCount: 4,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              selecteImageNotifier.value = index;
              // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
              selecteImageNotifier.notifyListeners();
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: CachedNetworkImage(
                width: widthMedia * 0.04,
                height: heightMedia * 0.07,
                imageUrl: imageList[index],
                fit: BoxFit.cover,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: widthMedia * 0.04,
                    height: heightMedia * 0.07,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(imageList[index]),
                          fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(14),
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
