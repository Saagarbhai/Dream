import 'package:dreamvila/core/utils/app_export.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  late ImagePickerUtils imagePickerUtils;

  AuthBloc(this.imagePickerUtils) : super(AuthState.initial()) {
    on<OnLoginButtonPressEvent>(_onLoginButtonPressEvent);
    on<TogglePasswordVisibilityEvent>(_togglePasswordVisibilityEvent);
    on<OnHobbyChangeEvent>(_onHobbyChangeEvent);
    on<OnGenderChangeEvent>(_onGenderChangeEvent);
    on<ImagePickedEvent>(_imagePickedEvent);
  }

  void _onLoginButtonPressEvent(
      OnLoginButtonPressEvent event, Emitter emit) async {
    emit(state.copyWith(signInStatus: Status.loading));
    // ignore: unused_local_variable
    Map<String, dynamic> data = {
      "email": event.email,
      "password": event.password
    };

    emit(state.copyWith(signInStatus: Status.success));
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
}
