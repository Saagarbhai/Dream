import '../../../core/utils/app_export.dart';

class CommonAuthFooter extends StatelessWidget {
  final String buttonText;
  final String footerText;
  final VoidCallback onActionTap;
  final VoidCallback onButtonTap;
  final bool isLoading;

  const CommonAuthFooter({
    super.key,
    required this.buttonText,
    required this.footerText,
    required this.onActionTap,
    required this.onButtonTap,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomElevatedButton(
              height: 0.060.sh,
              width: 0.90.sw,
              text: buttonText,
              buttonTextStyle: TextStyle(
                color: Theme.of(context).customColors.secondaryColor,
                fontSize: 16,
              ),
              buttonStyle: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).customColors.primaryColor,
              ),
              isLoading: isLoading,
              onPressed: onButtonTap,
            ),
          ],
        ),
        SizedBox(height: 40.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              footerText,
              style: TextStyle(color: const Color(0xFF000000), fontSize: 15.sp),
            ),
            InkWell(
              onTap: onActionTap,
              child: Text(
                buttonText,
                style: TextStyle(
                  color: Theme.of(context).customColors.primaryColor,
                  fontSize: 15.sp,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImageView(
              imagePath: "assets/images/auth_bottom.png",
              height: 30.h,
            ),
          ],
        ),
      ],
    );
  }
}
