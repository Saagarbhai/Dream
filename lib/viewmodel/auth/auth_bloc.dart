import 'dart:developer';
import 'package:dreamvila/core/utils/app_export.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository = AuthRepository(ApiClient());
  final SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();
  late ImagePickerUtils imagePickerUtils;

  AuthBloc(this.imagePickerUtils) : super(AuthState.initial()) {
    on<OnLoginButtonPressEvent>(_onLoginButtonPressEvent);
    on<TogglePasswordVisibilityEvent>(_togglePasswordVisibilityEvent);
    on<OnHobbyChangeEvent>(_onHobbyChangeEvent);
    on<OnGenderChangeEvent>(_onGenderChangeEvent);
    on<ImagePickedEvent>(_imagePickedEvent);
    on<OnSignUpButtonPressEvent>(_onSignUpButtonPressEvent);
  }

  void _onLoginButtonPressEvent(
      OnLoginButtonPressEvent event, Emitter emit) async {
    emit(state.copyWith(signInStatus: Status.loading));
    Map<String, dynamic> data = {
      "email": event.email,
      "password": event.password
    };
    final storage = FlutterSecureStorage();

    final result = await authRepository.logInRepo(data);
    if (result.status) {
      await storage.write(key: "deviceToken", value: result.token);
      sharedPreferencesService.storeUserIsLogin(true);
      emit(state.copyWith(signInStatus: Status.success));
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeRoute);
      state.signinemailController.clear();
      state.signinpasswordController.clear();
    } else {
      emit(state.copyWith(signInStatus: Status.failure));
    }
  }

  void _togglePasswordVisibilityEvent(
      TogglePasswordVisibilityEvent event, Emitter emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  void _onHobbyChangeEvent(OnHobbyChangeEvent event, Emitter emit) {
    List<String> currentHobbies = List<String>.from(state.selectedHobbies);
    if (currentHobbies.contains(event.hobby)) {
      currentHobbies.remove(event.hobby);
    } else {
      currentHobbies.add(event.hobby);
    }
    emit(state.copyWith(selectedHobbies: currentHobbies));
  }

  void _onGenderChangeEvent(OnGenderChangeEvent event, Emitter emit) {
    emit(state.copyWith(gender: event.gender));
  }

  void _imagePickedEvent(ImagePickedEvent event, Emitter emit) async {
    XFile? file = await imagePickerUtils.PickImageFromGallary();
    emit(state.copyWith(file: File(file!.path)));
  }

  void _onSignUpButtonPressEvent(OnSignUpButtonPressEvent event, Emitter emit) {
    emit(state.copyWith(signInStatus: Status.success));

    try {
      if (state.signInStatus == Status.success) {
        NavigatorService.pushAndRemoveUntil(AppRoutes.signinRoute);
        state.signupemailController.clear();
        state.signupfirstnameController.clear();
        state.signuplastnameController.clear();
        state.signupMobileController.clear();
        state.signuppasswordController.clear();
        state.signupConfirmpassController.clear();
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
