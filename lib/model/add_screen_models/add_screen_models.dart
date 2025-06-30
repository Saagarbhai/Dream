class ProductResponse {
  final bool status;
  final String message;
  final ProductData? data;

  ProductResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return ProductResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? ProductData.fromJson(json['data']) : null,
    );
  }
}

class ProductData {
  final String title;
  final String description;
  final String address;
  final int price;
  final int discountPercentage;
  final double rating;
  final int plot;
  final String type;
  final int bedroom;
  final int hall;
  final int kitchen;
  final int washroom;
  final String thumbnail;
  final String images;
  final String userId;
  final String id;

  ProductData({
    required this.title,
    required this.description,
    required this.address,
    required this.price,
    required this.discountPercentage,
    required this.rating,
    required this.plot,
    required this.type,
    required this.bedroom,
    required this.hall,
    required this.kitchen,
    required this.washroom,
    required this.thumbnail,
    required this.images,
    required this.userId,
    required this.id,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      address: json['address'] ?? '',
      price: json['price'] ?? 0,
      discountPercentage: json['discountPercentage'] ?? 0,
      rating: (json['rating'] ?? 0).toDouble(),
      plot: json['plot'] ?? 0,
      type: json['type'] ?? '',
      bedroom: json['bedroom'] ?? 0,
      hall: json['hall'] ?? 0,
      kitchen: json['kitchen'] ?? 0,
      washroom: json['washroom'] ?? 0,
      thumbnail: json['thumbnail'] ?? '',
      images: json['images'] ?? '',
      userId: json['userId'] ?? '',
      id: json['_id'] ?? '',
    );
  }
}
