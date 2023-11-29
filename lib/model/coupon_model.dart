class CouponModel {
  final String id;
  final String vendorId;
  final String couponCode;
  final int discount;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> users;
  final bool isExpire;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  CouponModel({
    required this.id,
    required this.vendorId,
    required this.couponCode,
    required this.discount,
    required this.startDate,
    required this.endDate,
    required this.users,
    required this.isExpire,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory CouponModel.fromJson(Map<String, dynamic> json) {
    return CouponModel(
      id: json['_id'],
      vendorId: json['vendorId'],
      couponCode: json['couponCode'],
      discount: json['discount'],
      startDate: DateTime.parse(json['startDate']),
      endDate: DateTime.parse(json['endDate']),
      users: List<String>.from(json['users']),
      isExpire: json['isExpire'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      v: json['__v'],
    );
  }
}
