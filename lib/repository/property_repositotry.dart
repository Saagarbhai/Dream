import 'package:dreamvila/core/utils/app_export.dart';

class PropertyRepositotry {
  final ApiClient apiClient;

  PropertyRepositotry(this.apiClient);

  Future<PropertyModel> getAllPropertyData() async {
    try {
      final response = await apiClient.request(
        RequestType.GET,
        ApiEndPoint.productUrl,
      );
      return PropertyModel.fromJson(response);
    } catch (e) {
      Logger.lOG(e.toString());
      rethrow;
    }
  }

  Future<ProductFoundResponse> getOnePropertyDetail(String id) async {
    try {
      final response = await apiClient.request(
          RequestType.GET, '${ApiEndPoint.productDetailUrl}/$id');
      return ProductFoundResponse.fromJson(response);
    } catch (e) {
      Logger.lOG(e.toString());
      rethrow;
    }
  }

  Future<ProductUpdateResponse> addProperty(
      Map<String, dynamic> property) async {
    try {
      final response = await apiClient
          .request(RequestType.POST, ApiEndPoint.addProductUrl, data: property);
      return ProductUpdateResponse.fromJson(response);
    } catch (e) {
      Logger.lOG(e.toString());
      rethrow;
    }
  }

  Future<ProductUpdateResponse> updateProperty(
      Map<String, dynamic> product, String id) async {
    try {
      final response = await apiClient.request(
          RequestType.PUT, '${ApiEndPoint.updateProductUrl}/$id',
          data: product);
      return ProductUpdateResponse.fromJson(response);
    } catch (e) {
      Logger.lOG(e.toString());
      rethrow;
    }
  }

  Future<PropertyDeleteResponse> deleteProperty(String id) async {
    try {
      final response = await apiClient.request(
          RequestType.DELETE, '${ApiEndPoint.deleteProductUrl}/$id');
      return PropertyDeleteResponse.fromJson(response);
    } catch (e) {
      Logger.lOG(e.toString());
      rethrow;
    }
  }
}
