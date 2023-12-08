import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking_user_app/model/wishlist_model.dart';
import '../../../blocs/wishlist_bloc/wishlist_bloc.dart';
import '../../const/custom_colors.dart';
import '../../../model/room_model.dart';

class FavoriteWidget extends StatefulWidget {
  final List<WishlistModel> wishlist;
  final RoomsModel data;

  const FavoriteWidget({
    Key? key,
    required this.wishlist,
    required this.data,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _FavoriteWidgetState createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  late ValueNotifier<bool> iconColorCheck;

  @override
  void initState() {
    super.initState();

    iconColorCheck = ValueNotifier<bool>(
        widget.wishlist.any((e) => e.roomId.id == widget.data.id));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 40,
      height: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
      ),
      child: InkWell(
        onTap: () {
          iconColorCheck.value = !iconColorCheck.value;

          if (iconColorCheck.value) {
            context.read<WishlistBloc>().add(AddWishlistEvent(
                roomId: widget.data.id, vendorId: widget.data.vendorId.id));
          } else if (iconColorCheck.value == false) {
            context
                .read<WishlistBloc>()
                .add(RemoveWishlistRoom(roomId: widget.data.id));
          }
        },
        child: ValueListenableBuilder<bool>(
          valueListenable: iconColorCheck,
          builder: (context, value, child) {
            return Icon(
              Icons.favorite_outlined,
              color: value ? CustomColors.mainColor : CustomColors.grey,
              size: 16,
            );
          },
        ),
      ),
    );
  }
}
