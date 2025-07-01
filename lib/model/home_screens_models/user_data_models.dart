class UserDetailResponse {
  final bool status;
  final String message;
  final UserDetailData? data;

  UserDetailResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory UserDetailResponse.fromJson(Map<String, dynamic> json) {
    return UserDetailResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? UserDetailData.fromJson(json['data']) : null,
    );
  }
}

class UserDetailData {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final int gender;
  final String image;
  final String password;
  final List<String> hobby;

  UserDetailData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.image,
    required this.password,
    required this.hobby,
  });

  factory UserDetailData.fromJson(Map<String, dynamic> json) {
    return UserDetailData(
      id: json['_id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'].toString(),
      gender: json['gender'] ?? 0,
      image: json['image'] ?? '',
      password: json['password'] ?? '',
      hobby: (json['hobby'] as String?)?.split(',') ?? [],
    );
  }
}
