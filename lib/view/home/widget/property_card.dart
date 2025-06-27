import 'dart:developer';

import 'package:dreamvila/core/utils/app_export.dart';

class PropertyCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String address;
  final int plots;
  final int discount;
  final double rating;
  final int price;

  const PropertyCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.address,
    required this.plots,
    required this.discount,
    required this.rating,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {},
      onTap: () {
        try {
          NavigatorService.pushNamed(AppRoutes.detailsRoute);
        } catch (e) {
          log(e.toString());
        }
      },
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 3.h),
        elevation: 5,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            children: [
              _buildImage(),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleAndPrice(),
                    SizedBox(height: 4.h),
                    _buildLocation(),
                    SizedBox(height: 8.h),
                    _buildInfoRow(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: AppImageView(
        imagePath: imageUrl,
        width: 100.w,
        height: 100.h,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildTitleAndPrice() {
    return Row(
      children: [
        Expanded(
          child: _text(title, fontSize: 16.sp, isBold: true),
        ),
        _text('\$$price',
            fontSize: 16.sp, isBold: true, color: Colors.deepOrange),
      ],
    );
  }

  Widget _buildLocation() {
    return Row(
      children: [
        Icon(Icons.location_on, size: 16.sp, color: Colors.grey),
        SizedBox(width: 4.w),
        Expanded(
          child: _text(
            address,
            fontSize: 15.sp,
            color: Colors.grey,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow(BuildContext context) {
    return Row(
      children: [
        _text("Plots $plots", fontSize: 14.sp),
        SizedBox(width: 10.w),
        _verticleDevider(context),
        SizedBox(width: 10.w),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
          decoration: BoxDecoration(
            color: Colors.orange.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: _text(
            "$discount % Discount",
            fontSize: 14.sp,
            color: Colors.deepOrange,
          ),
        ),
        SizedBox(width: 10.w),
        _verticleDevider(context),
        SizedBox(width: 10.w),
        Row(
          children: [
            Icon(Icons.star, size: 15.sp, color: Colors.orange),
            SizedBox(width: 2.w),
            _text(rating.toString(), fontSize: 14.sp),
          ],
        )
      ],
    );
  }

  Widget _verticleDevider(BuildContext context) {
    return _text("|", color: Theme.of(context).colorScheme.primary);
  }

  Widget _text(
    String text, {
    double fontSize = 14,
    Color? color,
    bool isBold = false,
    TextOverflow? overflow,
  }) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        fontSize: fontSize.sp,
        fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
        color: color ?? Colors.black,
      ),
    );
  }
}
