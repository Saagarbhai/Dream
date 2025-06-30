import '../../core/utils/app_export.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class TogglePasswordVisibilityEvent extends AuthEvent {}

class OnLoginButtonPressEvent extends AuthEvent {
  final String email;
  final String password;

  const OnLoginButtonPressEvent(this.email, this.password);

  @override
  List<Object> get props => [email, password];
}

class OnHobbyChangeEvent extends AuthEvent {
  final String hobby;
  const OnHobbyChangeEvent(this.hobby);

  @override
  List<Object> get props => [hobby];
}

class OnGenderChangeEvent extends AuthEvent {
  final String gender;
  const OnGenderChangeEvent(this.gender);

  @override
  List<Object> get props => [gender];
}

class ImagePickedEvent extends AuthEvent {}

class OnSignUpButtonPressEvent extends AuthEvent {
  final SignupModel formData;

  const OnSignUpButtonPressEvent(this.formData);

  @override
  List<Object> get props => [formData];
}
