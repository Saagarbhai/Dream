// ignore_for_file: must_be_immutable

import 'package:dreamvila/core/utils/app_export.dart';

class LabeledTextField extends StatelessWidget {
  final String label;
  final String? hint;
  bool? obscureText;
  final TextEditingController controller;
  final InputType inputType;
  final int? maxLines;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? textButton;

  LabeledTextField(
      {super.key,
      required this.label,
      this.obscureText,
      this.hint,
      required this.controller,
      required this.inputType,
      this.maxLines,
      this.validator,
      this.suffixIcon,
      this.textButton});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: textTheme.bodyLarge),
        SizedBox(height: 5.h),
        Stack(
          children: [
            CustomTextInputField(
              context: context,
              obscureText: obscureText,
              type: inputType,
              hintLabel: hint ?? label,
              controller: controller,
              hintStyle: textTheme.labelLarge
                  ?.copyWith(color: colorScheme.customColors.greyColor),
              validator: validator ??
                  (value) => Validation.validateNotEmpty(value, label),
              maxLines: maxLines ?? 1,
              suffixIcon: suffixIcon,
            ),
            Padding(
              padding: EdgeInsets.only(left: 247.w, top: 43.h),
              child: Container(
                child: textButton,
              ),
            )
          ],
        ),
        SizedBox(height: 15.h),
      ],
    );
  }
}
