import 'dart:developer';
import 'package:dreamvila/core/utils/app_export.dart';

class AuthRepository {
  final ApiClient apiClint;

  AuthRepository(this.apiClint);

  Future<UserResponse> signUpRepo(Map<String, dynamic> data) async {
    try {
      final responce = await apiClint.request(
          RequestType.MULTIPART_POST, ApiEndPoint.signUpUser,
          multipartData: data);
      return UserResponse.fromJson(responce);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to sign up user: $e');
    }
  }

  Future<LoginResponse> logInRepo(Map<String, dynamic> data) async {
    try {
      final responce = await apiClint
          .request(RequestType.POST, ApiEndPoint.signInUser, data: data);
      return LoginResponse.fromJson(responce);
    } catch (e) {
      log(e.toString());
      throw Exception('Failed to Log in user: $e');
    }
  }
}
