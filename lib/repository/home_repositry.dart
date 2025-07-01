import 'package:dreamvila/core/utils/app_export.dart';

class HomeRepositry {
  final ApiClient apiClient;
  HomeRepositry(this.apiClient);

  Future<UserDetailResponse> getUserRepo() async {
    try {
      final response =
          await apiClient.request(RequestType.GET, ApiEndPoint.userDataUrl);
      return UserDetailResponse.fromJson(response);
    } catch (e) {
      Logger.lOG(e.toString());
      rethrow;
    }
  }
}
