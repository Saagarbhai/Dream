class ProductListResponse {
  final bool status;
  final String message;
  final int page;
  final int limit;
  final int? prePage;
  final int? nextPage;
  final int total;
  final int totalPages;
  final List<ProductData> data;

  ProductListResponse({
    required this.status,
    required this.message,
    required this.page,
    required this.limit,
    this.prePage,
    this.nextPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory ProductListResponse.fromJson(Map<String, dynamic> json) {
    return ProductListResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      page: json['page'] ?? 0,
      limit: json['limit'] ?? 0,
      prePage: json['pre_page'],
      nextPage: json['next_page'],
      total: json['total'] ?? 0,
      totalPages: json['total_pages'] ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ProductData.fromJson(e))
              .toList() ??
          [],
    );
  }
}

class ProductData {
  final String id;
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
  final List<String> images;
  final String userId;

  ProductData({
    required this.id,
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
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['_id'] ?? '',
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
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e.toString())
              .toList() ??
          [],
      userId: json['userId'] ?? '',
    );
  }
}
