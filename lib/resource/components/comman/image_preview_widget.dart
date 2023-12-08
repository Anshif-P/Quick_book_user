import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

import '../../../model/room_model.dart';

class ImagePreviewWidget extends StatelessWidget {
  final RoomsModel data; // Replace with your data model
  final ValueNotifier<int> selectedImageNotifier;

  const ImagePreviewWidget(
      {super.key, required this.data, required this.selectedImageNotifier});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Show preview when the image is clicked
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return Center(
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: data.img[selectedImageNotifier.value],
                    placeholder: (context, url) => Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Image.network(
                        data.img[selectedImageNotifier.value],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            );
          },
          child: ValueListenableBuilder(
            valueListenable: selectedImageNotifier,
            builder: (context, value, _) => CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: data.img[selectedImageNotifier.value],
              placeholder: (context, url) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                    image: DecorationImage(
                      image: NetworkImage(data.img[0]),
                      fit: BoxFit.cover,
                    ),
                  ),
                  alignment: Alignment.topLeft,
                  padding: const EdgeInsets.only(top: 15),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
