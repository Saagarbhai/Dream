import 'package:dreamvila/core/utils/app_export.dart';

class AuthState extends Equatable {
  final Status signInStatus;
  final Status signUpStatus;
  final String errorMessage;
  final bool isPasswordVisible;
  final TextEditingController signinemailController;
  final TextEditingController signinpasswordController;
  final TextEditingController signupfirstnameController;
  final TextEditingController signuplastnameController;
  final TextEditingController signupemailController;
  final TextEditingController signuppasswordController;
  final TextEditingController signupConfirmpassController;
  final TextEditingController signupMobileController;
  final String gender;
  final List<String> selectedHobbies;
  final File? file;
  final GlobalKey<FormState> signinformKey = GlobalKey<FormState>();
  final GlobalKey<FormState> signupformkey = GlobalKey<FormState>();

  AuthState({
    this.signInStatus = Status.init,
    this.signUpStatus = Status.init,
    this.errorMessage = '',
    this.isPasswordVisible = true,
    required this.signinemailController,
    required this.signinpasswordController,
    required this.signupfirstnameController,
    required this.signuplastnameController,
    required this.signupemailController,
    required this.signupMobileController,
    required this.signupConfirmpassController,
    required this.signuppasswordController,
    GlobalKey<FormState>? signinformKey,
    GlobalKey<FormState>? signupformKey,
    this.gender = 'Male',
    this.file,
    this.selectedHobbies = const [],
  });

  factory AuthState.initial() {
    return AuthState(
      signinemailController: TextEditingController(),
      signinpasswordController: TextEditingController(),
      signupConfirmpassController: TextEditingController(),
      signupMobileController: TextEditingController(),
      signupemailController: TextEditingController(),
      signupfirstnameController: TextEditingController(),
      signuplastnameController: TextEditingController(),
      signuppasswordController: TextEditingController(),
    );
  }
  AuthState copyWith({
    String? gender,
    List<String>? selectedHobbies,
    Status? signInStatus,
    String? errorMessage,
    bool? isPasswordVisible,
    File? file,
    GlobalKey<FormState>? signinformKey,
    GlobalKey<FormState>? signupformKey,
    TextEditingController? signinemailController,
    TextEditingController? signinpasswordController,
    TextEditingController? signupfirstnameController,
    TextEditingController? signuplastnameController,
    TextEditingController? signupemailController,
    TextEditingController? signuppasswordController,
    TextEditingController? signupConfirmpassController,
    TextEditingController? signupMobileController,
  }) {
    return AuthState(
      gender: gender ?? this.gender,
      selectedHobbies: selectedHobbies ?? this.selectedHobbies,
      signInStatus: signInStatus ?? this.signInStatus,
      errorMessage: errorMessage ?? this.errorMessage,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      signinemailController:
          signinemailController ?? this.signinemailController,
      signinpasswordController:
          signinpasswordController ?? this.signinpasswordController,
      signinformKey: signinformKey,
      signupformKey: signupformKey,
      file: file ?? this.file,
      signupfirstnameController:
          signupfirstnameController ?? this.signupfirstnameController,
      signuplastnameController:
          signuplastnameController ?? this.signuplastnameController,
      signupemailController:
          signupemailController ?? this.signuppasswordController,
      signuppasswordController:
          signuppasswordController ?? this.signuppasswordController,
      signupConfirmpassController:
          signupConfirmpassController ?? this.signupConfirmpassController,
      signupMobileController:
          signupMobileController ?? this.signupMobileController,
    );
  }

  @override
  List<Object?> get props => [
        gender,
        file,
        selectedHobbies,
        signInStatus,
        errorMessage,
        isPasswordVisible,
        signinemailController,
        signinpasswordController,
        signupfirstnameController,
        signuplastnameController,
        signupMobileController,
        signupemailController,
        signuppasswordController,
        signupConfirmpassController,
        signinformKey,
        signupformkey
      ];
}
