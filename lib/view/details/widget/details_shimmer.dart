import 'package:dreamvila/core/utils/app_export.dart';

class DetailsScreenShimmer extends StatelessWidget {
  const DetailsScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            _buildCarouselShimmer(),
            SizedBox(height: 10.h),
            _buildPageIndicatorShimmer(),
            SizedBox(height: 10.h),
            _buildTextSpanShimmer(),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 30.w),
              child: Container(height: 20.h, width: 120.w, color: Colors.white),
            ),
            _buildDescriptionShimmer(context),
          ],
        ),
      ),
    );
  }

  Widget _buildTextSpanShimmer() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(height: 25.h, width: 0.7.sw, color: Colors.white),
          SizedBox(height: 8.h),
          Container(height: 25.h, width: 0.9.sw, color: Colors.white),
        ],
      ),
    );
  }

  Widget _buildDescriptionShimmer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Card(
        child: Container(
          width: 0.95.sw,
          margin:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(height: 80.h, color: Colors.white),
              SizedBox(height: 20.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 0.3.sw,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        11,
                        (index) => Column(
                          children: [
                            Container(
                                height: 18.h,
                                width: 0.25.sw,
                                color: Colors.white),
                            SizedBox(height: 15.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 20.w),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: List.generate(
                        11,
                        (index) => Column(
                          children: [
                            Container(
                                height: 18.h,
                                width: 0.4.sw,
                                color: Colors.white),
                            SizedBox(height: 15.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPageIndicatorShimmer() {
    return SizedBox(
      height: 10.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          5,
          (index) => Container(
            height: 9.h,
            width: 9.w,
            margin: EdgeInsets.symmetric(horizontal: 4.w),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCarouselShimmer() {
    return Container(
      height: 200.h,
      margin: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
    );
  }
}
