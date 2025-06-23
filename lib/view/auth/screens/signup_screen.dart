import 'dart:developer';
import 'package:dreamvila/core/utils/app_export.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Lang.of(context);
    return Scaffold(
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          try {
            if (state.signUpStatus == Status.success) {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  AppConstants.homeRoute, (route) => false);
            }
          } catch (e) {
            log(e.toString());
          }
        },
        builder: (context, state) {
          return SingleChildScrollView(
            child: SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 20.w, vertical: 5.h),
              child: Form(
                key: state.signupformkey,
                child: Column(
                  spacing: 10.h,
                  children: [
                    CommonAuthDesign(label: text.text_sign_up),
                    LabeledTextField(
                        label: text.lbl_first_name,
                        controller: state.signupfirstnameController,
                        inputType: InputType.name),
                    LabeledTextField(
                        label: text.lbl_last_name,
                        controller: state.signuplastnameController,
                        inputType: InputType.name),
                    LabeledTextField(
                        label: text.lbl_email,
                        controller: state.signupemailController,
                        inputType: InputType.email),
                    LabeledTextField(
                        label: text.lbl_mobile,
                        controller: state.signupMobileController,
                        inputType: InputType.phoneNumber),
                    _buildGender(context, state)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGender(BuildContext context, AuthState state) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(Lang.of(context).lbl_gender,
            style: Theme.of(context).textTheme.bodyLarge),
        Row(
          children: [
            CommonRadioButton(
                label: Lang.of(context).text_male,
                selectedGender: state.gender,
                onChanged: (value) {
                  context.read<AuthBloc>().add(OnGenderChangeEvent(value!));
                }),
            SizedBox(width: 140.w),
            CommonRadioButton(
                label: Lang.of(context).text_felame,
                selectedGender: state.gender,
                onChanged: (value) {
                  context.read<AuthBloc>().add(OnGenderChangeEvent(value!));
                }),
          ],
        ),
      ],
    );
  }
}
