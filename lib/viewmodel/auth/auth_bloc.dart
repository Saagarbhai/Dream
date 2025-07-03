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
    try {
      emit(state.copyWith(signInStatus: Status.loading));
      Map<String, dynamic> data = {
        "email": event.email,
        "password": event.password
      };
      final storage = FlutterSecureStorage();

      final result = await authRepository.logInRepo(data);

      if (result.status == true) {
        await storage.write(key: "deviceToken", value: result.token);
        sharedPreferencesService.storeUserIsLogin(true);
        emit(state.copyWith(signInStatus: Status.success));
        NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeRoute);
        state.signinemailController.clear();
        state.signinpasswordController.clear();
      } else {
        emit(state.copyWith(signInStatus: Status.failure));
      }
    } catch (e) {
      Logger.error("Error From OnLoginButtonPressEvent : $e");
    }
  }

  void _togglePasswordVisibilityEvent(
      TogglePasswordVisibilityEvent event, Emitter emit) {
    try {
      emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
    } catch (e) {
      Logger.error("Error From OnLoginButtonPressEvent : $e");
    }
  }

  void _onHobbyChangeEvent(OnHobbyChangeEvent event, Emitter emit) {
    try {
      List<String> currentHobbies = List<String>.from(state.selectedHobbies);
      if (currentHobbies.contains(event.hobby)) {
        currentHobbies.remove(event.hobby);
      } else {
        currentHobbies.add(event.hobby);
      }
      emit(state.copyWith(selectedHobbies: currentHobbies));
    } catch (e) {
      Logger.error("Error From OnHobbyChangeEvent : $e");
    }
  }

  void _onGenderChangeEvent(OnGenderChangeEvent event, Emitter emit) {
    try {
      emit(state.copyWith(gender: event.gender));
    } catch (e) {
      Logger.error("Error From OnGenderChangeEvent : $e");
    }
  }

  void _imagePickedEvent(ImagePickedEvent event, Emitter emit) async {
    try {
      XFile? file = await imagePickerUtils.PickImageFromGallary();
      emit(state.copyWith(file: File(file!.path)));
    } catch (e) {
      Logger.error("Error From ImagePickedEvent : $e");
    }
  }

  void _onSignUpButtonPressEvent(
      OnSignUpButtonPressEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(signUpStatus: Status.loading));
      Map<String, dynamic> data = {
        'image': [event.formData.image!.path],
        'firstName': event.formData.firstName,
        'lastName': event.formData.lastName,
        'gender': event.formData.gender.toString(),
        'hobby': event.formData.hobbies,
        'email': event.formData.email,
        'mobile': event.formData.mobile.toString(),
        'password': event.formData.password
      };
      final result = await authRepository.signUpRepo(data);

      if (result.status == true) {
        emit(state.copyWith(signUpStatus: Status.success));
        NavigatorService.pushAndRemoveUntil(AppRoutes.signinRoute);
        state.signupemailController.clear();
        state.signupfirstnameController.clear();
        state.signuplastnameController.clear();
        state.signupMobileController.clear();
        state.signuppasswordController.clear();
        state.signupConfirmpassController.clear();
        state.selectedHobbies.clear();
        emit(state.copyWith(file: null));
      } else {
        emit(state.copyWith(signUpStatus: Status.failure));
      }
    } catch (e) {
      Logger.error("Error From OnSignUpButtonPressEvent : $e");
    }
  }
}
