import 'dart:developer';
import 'package:dreamvila/core/utils/app_export.dart';

class SignInScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return const SignInScreen();
  }

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Lang.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            return build_signin_screen(text, state, context);
          },
        ),
      ),
    );
  }

  Widget build_signin_screen(Lang text, AuthState state, BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        minimum: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
        child: Form(
          key: state.signinformKey,
          child: Column(
            spacing: 10.h,
            children: [
              CommonAuthDesign(label: text.text_sign_in),
              LabeledTextField(
                  label: text.lbl_email,
                  hint: text.hint_email,
                  controller: state.signinemailController,
                  inputType: InputType.email),
              LabeledTextField(
                label: text.lbl_password,
                hint: text.hint_password,
                controller: state.signinpasswordController,
                inputType: InputType.text,
                obscureText: state.isPasswordVisible,
                suffixIcon: PasswordVisibilityToggleButton(
                  isPasswordVisible: state.isPasswordVisible,
                ),
                textButton: build_text_button(text),
              ),
              SizedBox(height: 20.h),
              CommonAuthBottom(
                buttonText: text.text_sign_up,
                footerText: text.text_YouDoNotHaveAccount,
                footerTextButtonText: text.text_sign_in,
                isLoading: state.signInStatus == Status.loading,
                onActionTap: () {
                  try {
                    NavigatorService.pushNamedAndRemoveUntil(
                        AppRoutes.signupRoute);
                  } catch (e) {
                    log(e.toString());
                  }
                },
                onButtonTap: () {
                  if (state.signinformKey.currentState!.validate()) {
                    context.read<AuthBloc>().add(OnLoginButtonPressEvent(
                        state.signinemailController.text,
                        state.signinpasswordController.text));
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget build_text_button(Lang text) {
    return TextButton(
      onPressed: () {
        log('Forget Password Pressed');
      },
      child: Text(text.text_forgetpassword),
    );
  }
}
