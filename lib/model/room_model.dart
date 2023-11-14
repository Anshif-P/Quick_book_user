class RoomsModel {
  final String id;
  final VendorDetails vendorId;
  final String address;
  final String city;
  final String state;
  final String zip;
  final List<String> img;
  final String propertyType;
  final String description;
  final String price;
  final String capacity;
  final String totalRoomRate;
  final String totalRooms;
  final String adultsRate;
  final String location;
  final String longitude;
  final double latitude;
  final String category;
  final List<String> amenities;
  final bool isApproved;
  final bool isBanned;
  final String createdAt;
  final String updatedAt;
  final int v;

  RoomsModel({
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
    required this.totalRooms,
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
    required this.v,
  });

  factory RoomsModel.fromJson(Map<String, dynamic> json) {
    return RoomsModel(
      id: json['_id'],
      vendorId: VendorDetails.fromJson(json['vendorId']),
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
      totalRooms: json['totalrooms'],
      adultsRate: json['AdultsRate'],
      location: json['location'],
      longitude: json['longitude'],
      latitude: json['latitude'],
      category: json['category'],
      amenities: List<String>.from(json['amenities']),
      isApproved: json['isApproved'],
      isBanned: json['isBanned'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}

class VendorDetails {
  final String id;
  final String name;
  final String email;
  final String password;
  final String propertyName;
  final String propertyLocation;
  final String phone;
  final bool isBanned;
  final String createdAt;
  final String updatedAt;
  final int v;
  final String image;

  VendorDetails({
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
    required this.v,
    required this.image,
  });

  factory VendorDetails.fromJson(Map<String, dynamic> json) {
    return VendorDetails(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      propertyName: json['propertyName'],
      propertyLocation: json['propertyLocation'],
      phone: json['phone'],
      isBanned: json['isBanned'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
      image: json['image'],
    );
  }
}
