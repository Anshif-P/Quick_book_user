class UserModel {
  final String id;
  String name;
  String email;
  final String password;
  final String phone;
  final bool isBanned;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String? token;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    required this.isBanned,
    required this.createdAt,
    required this.updatedAt,
    this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json, token) {
    return UserModel(
      token: token,
      id: json['_id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      phone: json['phone'],
      isBanned: json['isBanned'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
