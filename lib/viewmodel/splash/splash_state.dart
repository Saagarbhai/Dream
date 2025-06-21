import '../../core/utils/app_export.dart';

class SplashState extends Equatable {
  final Status splashStatus;
  final String errorMessage;

  const SplashState({this.splashStatus = Status.init, this.errorMessage = ''});

  SplashState copyWith({Status? splashStatus, String? errorMessage}) {
    return SplashState(
      splashStatus: splashStatus ?? this.splashStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object> get props => [splashStatus, errorMessage];
}
