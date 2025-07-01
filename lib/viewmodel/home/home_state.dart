import 'package:dreamvila/core/utils/app_export.dart';

class HomeState extends Equatable {
  final int index;
  final Status homeStatus;
  final Status propertyStatus;
  final PropertyModel? data;
  final String errorMessage;
  final UserDetailResponse? user;

  const HomeState(
      {this.index = 0,
      this.homeStatus = Status.init,
      this.propertyStatus = Status.init,
      this.data,
      this.errorMessage = '',
      this.user});

  HomeState copyWith({
    int? index,
    Status? homeStatus,
    Status? propertyStatus,
    PropertyModel? data,
    UserDetailResponse? user,
    String? errorMessage,
  }) {
    return HomeState(
      index: index ?? this.index,
      homeStatus: homeStatus ?? this.homeStatus,
      propertyStatus: propertyStatus ?? this.propertyStatus,
      data: data ?? this.data,
      user: user ?? this.user,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props =>
      [homeStatus, propertyStatus, data, user, errorMessage, index];
}
