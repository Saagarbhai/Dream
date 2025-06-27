import 'package:dreamvila/core/utils/app_export.dart';

class HomeState extends Equatable {
  final int index;
  final Status homeStatus;
  final String errorMessage;

  const HomeState({
    this.index = 0,
    this.homeStatus = Status.init,
    this.errorMessage = '',
  });

  HomeState copyWith({
    int? index,
    Status? homeStatus,
    String? errorMessage,
  }) {
    return HomeState(
      index: index ?? this.index,
      homeStatus: homeStatus ?? this.homeStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [homeStatus, errorMessage, index];
}
