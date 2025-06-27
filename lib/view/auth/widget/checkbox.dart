import 'package:dreamvila/core/utils/app_export.dart';

// ignore: must_be_immutable
class CustomCheckbox extends StatelessWidget {
  final bool value;
  final String text;
  Function(bool?) onChanged;
  CustomCheckbox(
      {super.key,
      required this.value,
      required this.text,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(hoverColor: Colors.white, value: value, onChanged: onChanged),
        Text(text),
      ],
    );
  }
}
