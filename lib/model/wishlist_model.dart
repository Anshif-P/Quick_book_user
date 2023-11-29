// class WishlistModel {
//   final RoomId roomId;

//   WishlistModel({
//     required this.roomId,
//   });

//   factory WishlistModel.fromJson(Map<String, dynamic> json) {
//     print('in side the wish list model -------------------------------');
//     print(json);
//     return WishlistModel(
//       roomId: RoomId.fromJson(json['roomId']),
//     );
//   }
// }

// class RoomId {
//   final String id;

//   RoomId({
//     required this.id,
//   });

//   factory RoomId.fromJson(Map<String, dynamic> json) {
//     return RoomId(
//       id: json['_id'],
//     );
//   }
// }

class WishlistModel {
  final RoomId roomId;

  WishlistModel({
    required this.roomId,
  });

  factory WishlistModel.fromJson(Map<String, dynamic> json) {
    dynamic roomIdJson = json['roomId'];

    if (roomIdJson is String) {
      // If 'roomId' is a string, create RoomId directly
      return WishlistModel(roomId: RoomId(id: roomIdJson));
    } else if (roomIdJson is Map<String, dynamic>) {
      // If 'roomId' is a map, use RoomId.fromJson
      return WishlistModel(roomId: RoomId.fromJson(roomIdJson));
    } else {
      // Handle the case where 'roomId' is neither a string nor a map
      throw FormatException("Invalid format for 'roomId'");
    }
  }
}

class RoomId {
  final String id;

  RoomId({
    required this.id,
  });

  factory RoomId.fromJson(Map<String, dynamic> json) {
    return RoomId(
      id: json['_id'],
    );
  }
}
