import 'package:dreamvila/core/utils/app_export.dart';

class LabeledStarRatingField extends StatelessWidget {
  final String label;
  final double maxRating;
  final double itemSize;
  final bool allowHalfRating;
  final Widget? suffixIcon;

  const LabeledStarRatingField({
    super.key,
    required this.label,
    this.maxRating = 5.0,
    this.itemSize = 32.0,
    this.allowHalfRating = true,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(label, style: textTheme.bodyLarge),
        SizedBox(height: 5.h),
        Stack(
          children: [
            BlocBuilder<AddupdateBloc, AddupdateState>(
              builder: (context, state) {
                return RatingBar.builder(
                  initialRating: state.rating,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: allowHalfRating,
                  itemCount: maxRating.toInt(),
                  itemSize: itemSize,
                  unratedColor: colorScheme.customColors.greyColor,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) =>
                      const Icon(Icons.star, color: Colors.amber),
                  onRatingUpdate: (rating) {
                    context
                        .read<AddupdateBloc>()
                        .add(RatingChangedEvent(rating));
                  },
                );
              },
            ),
            if (suffixIcon != null)
              Positioned(
                right: 0,
                top: 0,
                child: suffixIcon!,
              ),
          ],
        ),
      ],
    );
  }
}
