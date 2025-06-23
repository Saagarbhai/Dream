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
                        hint: text.hint_name,
                        controller: state.signupfirstnameController,
                        inputType: InputType.name),
                    LabeledTextField(
                        label: text.lbl_last_name,
                        hint: text.hint_name,
                        controller: state.signuplastnameController,
                        inputType: InputType.name),
                    LabeledTextField(
                        label: text.lbl_email,
                        hint: text.hint_email,
                        controller: state.signupemailController,
                        inputType: InputType.email),
                    LabeledTextField(
                        label: text.lbl_mobile,
                        hint: text.hint_mobile,
                        controller: state.signupMobileController,
                        inputType: InputType.phoneNumber),
                    _buildGender(context, state),
                    _buildImageInput(context, state),
                    LabeledTextField(
                      label: text.lbl_password,
                      hint: text.hint_password,
                      obscureText: state.isPasswordVisible,
                      controller: state.signuppasswordController,
                      inputType: InputType.email,
                      suffixIcon: PasswordVisibilityToggleButton(
                        isPasswordVisible: state.isPasswordVisible,
                      ),
                    ),
                    LabeledTextField(
                      label: text.lbl_Confirm_password,
                      hint: text.hint_password,
                      controller: state.signupConfirmpassController,
                      inputType: InputType.email,
                      obscureText: state.isPasswordVisible,
                      suffixIcon: PasswordVisibilityToggleButton(
                        isPasswordVisible: state.isPasswordVisible,
                      ),
                    ),
                    _buildHobbyInput(context, state)
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

  Widget _buildImageInput(BuildContext context, AuthState state) {
    return CommonImageInput(
      label: Lang.of(context).text_upload_user_profile,
      imagePaths: state.file != null ? [state.file!.path.toString()] : [],
      onTap: () {
        try {
          context.read<AuthBloc>().add(ImagePickedEvent());
        } catch (e) {
          log(e.toString());
        }
      },
    );
  }

  Widget _buildHobbyInput(BuildContext context, AuthState state) {
    final List<String> hobbies = ['Reading', 'Gaming', 'Traveling', 'Cooking'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Hobby", style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(
          height: 10.h,
        ),
        Row(
          children: [
            CustomCheckbox(
              value: state.selectedHobbies.contains(hobbies[0]),
              text: hobbies[0],
              onChanged: (_) {
                try {
                  context.read<AuthBloc>().add(OnHobbyChangeEvent(hobbies[0]));
                } catch (e) {
                  log(e.toString());
                }
              },
            ),
            SizedBox(width: 63.w),
            CustomCheckbox(
              value: state.selectedHobbies.contains(hobbies[1]),
              text: hobbies[1],
              onChanged: (_) {
                try {
                  context.read<AuthBloc>().add(OnHobbyChangeEvent(hobbies[1]));
                } catch (e) {
                  log(e.toString());
                }
              },
            ),
          ],
        ),
        Row(
          children: [
            CustomCheckbox(
              value: state.selectedHobbies.contains(hobbies[2]),
              text: hobbies[2],
              onChanged: (_) {
                try {
                  context.read<AuthBloc>().add(OnHobbyChangeEvent(hobbies[2]));
                } catch (e) {
                  log(e.toString());
                }
              },
            ),
            SizedBox(width: 60.w),
            CustomCheckbox(
              value: state.selectedHobbies.contains(hobbies[3]),
              text: hobbies[3],
              onChanged: (_) {
                try {
                  context.read<AuthBloc>().add(OnHobbyChangeEvent(hobbies[3]));
                } catch (e) {
                  log(e.toString());
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
