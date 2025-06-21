import '../../core/utils/app_export.dart';

abstract class SplashEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadSplashEvent extends SplashEvent {}
