class ProductDeleteResponse {
  final bool status;
  final String message;

  ProductDeleteResponse({
    required this.status,
    required this.message,
  });

  factory ProductDeleteResponse.fromJson(Map<String, dynamic> json) {
    return ProductDeleteResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
