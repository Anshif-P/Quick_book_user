import 'package:hotel_booking_user_app/model/rating_review_model.dart';

class BookedRoomModel {
  String id;
  RoomId roomId;
  String userId;
  VendorId vendorId;
  int adult;
  int rooms;
  String location;
  DateTime checkIn;
  DateTime checkOut;
  int roomPrice;
  String type;
  int total;
  String address;
  int phone;
  String place;
  int days;
  bool isCancel;
  DateTime createdAt;
  DateTime updatedAt;

  BookedRoomModel({
    required this.id,
    required this.roomId,
    required this.userId,
    required this.vendorId,
    required this.adult,
    required this.rooms,
    required this.location,
    required this.checkIn,
    required this.checkOut,
    required this.roomPrice,
    required this.type,
    required this.total,
    required this.address,
    required this.phone,
    required this.place,
    required this.days,
    required this.isCancel,
    required this.createdAt,
    required this.updatedAt,
  });

  factory BookedRoomModel.fromJson(Map<String, dynamic> json) {
    return BookedRoomModel(
      id: json['_id'],
      roomId: RoomId.fromJson(json['roomId']),
      userId: json['userId'],
      vendorId: VendorId.fromJson(json['vendorId']),
      adult: json['adult'],
      rooms: json['rooms'],
      location: json['location'],
      checkIn: DateTime.parse(json['checkIn']),
      checkOut: DateTime.parse(json['checkOut']),
      roomPrice: json['RoomPrice'],
      type: json['type'],
      total: json['total'],
      address: json['address'],
      phone: json['phone'],
      place: json['place'],
      days: json['days'],
      isCancel: json['isCancel'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class RoomId {
  String id;
  String vendorId;
  String address;
  String city;
  String state;
  String zip;
  List<String> img;
  String propertyType;
  String description;
  String price;
  String capacity;
  String totalRoomRate;
  String totalrooms;
  String adultsRate;
  String location;
  String longitude;
  double latitude;
  String category;
  List<String> amenities;
  bool isApproved;
  bool isBanned;
  DateTime createdAt;
  DateTime updatedAt;

  RoomId({
    required this.id,
    required this.vendorId,
    required this.address,
    required this.city,
    required this.state,
    required this.zip,
    required this.img,
    required this.propertyType,
    required this.description,
    required this.price,
    required this.capacity,
    required this.totalRoomRate,
    required this.totalrooms,
    required this.adultsRate,
    required this.location,
    required this.longitude,
    required this.latitude,
    required this.category,
    required this.amenities,
    required this.isApproved,
    required this.isBanned,
    required this.createdAt,
    required this.updatedAt,
  });

  factory RoomId.fromJson(Map<String, dynamic> json) {
    return RoomId(
      id: json['_id'],
      vendorId: json['vendorId'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      zip: json['zip'],
      img: List<String>.from(json['img']),
      propertyType: json['propertyType'],
      description: json['description'],
      price: json['price'],
      capacity: json['capacity'],
      totalRoomRate: json['totalRoomRate'],
      totalrooms: json['totalrooms'],
      adultsRate: json['AdultsRate'],
      location: json['location'],
      longitude: json['longitude'],
      latitude: json['latitude'].toDouble(),
      category: json['category'],
      amenities: List<String>.from(json['amenities']),
      isApproved: json['isApproved'],
      isBanned: json['isBanned'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}

class VendorId {
  String id;
  String name;
  String email;
  String password;
  String propertyName;
  String propertyLocation;
  String phone;
  bool isBanned;
  DateTime createdAt;
  DateTime updatedAt;

  String image;

  VendorId({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.propertyName,
    required this.propertyLocation,
    required this.phone,
    required this.isBanned,
    required this.createdAt,
    required this.updatedAt,
    required this.image,
  });

  factory VendorId.fromJson(Map<dynamic, dynamic> json) {
    return VendorId(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      propertyName: json['propertyName'],
      propertyLocation: json['propertyLocation'],
      phone: json['phone'],
      isBanned: json['isBanned'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      image: json['image'],
    );
  }
}
