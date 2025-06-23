import 'package:dreamvila/core/utils/app_export.dart';

class PasswordVisibilityToggleButton extends StatelessWidget {
  final bool isPasswordVisible;

  const PasswordVisibilityToggleButton(
      {super.key, required this.isPasswordVisible});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        context.read<AuthBloc>().add(TogglePasswordVisibilityEvent());
      },
      icon: Icon(
        isPasswordVisible
            ? Icons.visibility_off_outlined
            : Icons.visibility_outlined,
        size: 20,
      ),
    );
  }
}
