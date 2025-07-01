import 'dart:io';

class UserResponse {
  final bool status;
  final String message;
  final UserData? data;

  UserResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? UserData.fromJson(json['data']) : null,
    );
  }
}

class UserData {
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final int gender;
  final String image;
  final String password;
  final List<String> hobby;
  final String id;
  final int v;

  UserData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.image,
    required this.password,
    required this.hobby,
    required this.id,
    required this.v,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      email: json['email'] ?? '',
      mobile: json['mobile'].toString(),
      gender: json['gender'] ?? 0,
      image: json['image'] ?? '',
      password: json['password'] ?? '',
      hobby: (json['hobby'] as String).split(','),
      id: json['_id'] ?? '',
      v: json['__v'] ?? 0,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'mobile': mobile,
      'gender': gender,
      'image': image,
      'password': password,
      'hobby': hobby,
      '_id': id,
      '__v': v,
    };
  }
}

class SignupModel {
  final File? image;
  final String firstName;
  final String lastName;
  final String email;
  final String mobile;
  final int gender;
  final String hobbies;
  final String password;

  const SignupModel({
    required this.image,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.mobile,
    required this.gender,
    required this.hobbies,
    required this.password,
  });
}
