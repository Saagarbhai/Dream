import 'package:dreamvila/core/utils/app_export.dart';

class PropertyCardShimmer extends StatelessWidget {
  const PropertyCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 3.h),
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Padding(
          padding: EdgeInsets.all(12.r),
          child: Row(
            children: [
              _buildImageShimmer(),
              SizedBox(width: 12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitleAndPriceShimmer(),
                    SizedBox(height: 4.h),
                    _buildLocationShimmer(),
                    SizedBox(height: 8.h),
                    _buildInfoRowShimmer(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildImageShimmer() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.r),
      child: Container(
        width: 100.w,
        height: 100.h,
        color: Colors.white,
      ),
    );
  }

  Widget _buildTitleAndPriceShimmer() {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 16.h,
            color: Colors.white,
          ),
        ),
        SizedBox(width: 8.w),
        Container(
          height: 16.h,
          width: 60.w,
          color: Colors.white,
        ),
      ],
    );
  }

  Widget _buildLocationShimmer() {
    return Row(
      children: [
        Container(
          height: 16.h,
          width: 16.w,
          color: Colors.white,
        ),
        SizedBox(width: 4.w),
        Expanded(
          child: Container(
            height: 15.h,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRowShimmer(BuildContext context) {
    return Row(
      children: [
        Container(
          height: 14.h,
          width: 50.w,
          color: Colors.white,
        ),
        SizedBox(width: 10.w),
        Container(
          height: 14.h,
          width: 2.w,
          color: Colors.white,
        ),
        SizedBox(width: 10.w),
        Container(
          height: 18.h,
          width: 80.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
          ),
        ),
        SizedBox(width: 10.w),
        Container(
          height: 14.h,
          width: 2.w,
          color: Colors.white,
        ),
        SizedBox(width: 10.w),
        Container(
          height: 14.h,
          width: 40.w,
          color: Colors.white,
        ),
      ],
    );
  }
}