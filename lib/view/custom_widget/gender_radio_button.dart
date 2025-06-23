import 'package:dreamvila/core/utils/app_export.dart';

class CommonRadioButton extends StatelessWidget {
  final String label;
  final String? selectedGender;
  final Function(String?)? onChanged;

  const CommonRadioButton(
      {super.key,
      required this.label,
      required this.selectedGender,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio<String>(
            value: label,
            groupValue: selectedGender,
            activeColor: Theme.of(context).customColors.primaryColor,
            hoverColor: Colors.orange,
            onChanged: onChanged),
        Text(
          label,
          style: TextStyle(fontSize: 15.sp),
        ),
      ],
    );
  }
}
