class PropertyDeleteResponse {
  final bool status;
  final String message;

  PropertyDeleteResponse({
    required this.status,
    required this.message,
  });

  factory PropertyDeleteResponse.fromJson(Map<String, dynamic> json) {
    return PropertyDeleteResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }
}
