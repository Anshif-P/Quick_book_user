class ReviewModel {
  final String id;
  final String roomId;
  final User userId;
  final String vendorId;
  final String feedback;
  final String stars;
  final String createdAt;
  final String updatedAt;
  final int v;

  ReviewModel({
    required this.id,
    required this.roomId,
    required this.userId,
    required this.vendorId,
    required this.feedback,
    required this.stars,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      id: json['_id'],
      roomId: json['roomId'],
      userId: User.fromJson(json['userId']),
      vendorId: json['vendorId'],
      feedback: json['feedback'],
      stars: json['stars'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}

class User {
  final String id;
  final String name;
  final String email;
  final String password;
  final String phone;
  final bool isBanned;
  final String createdAt;
  final String updatedAt;
  final int v;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.isBanned,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      isBanned: json['isBanned'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      v: json['__v'],
    );
  }
}
