import '../../../core/utils/app_export.dart';

class CommonAuthDesign extends StatelessWidget {
  final String label;
  const CommonAuthDesign({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 50.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImageView(
              imagePath: "assets/images/app_logo/Group 1000005948.png",
              height: 50.h,
              width: 200.w,
            ),
          ],
        ),
        SizedBox(height: 40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                  fontWeight: FontWeight.w600,
                  fontSize: 38.sp),
            )
          ],
        ),
        SizedBox(height: 40.h),
      ],
    );
  }
}
