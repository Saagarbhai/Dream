import 'package:dreamvila/core/utils/app_export.dart';

abstract class HomeEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class OnTabIndexChangeEvent extends HomeEvent {
  final int index;

  OnTabIndexChangeEvent(this.index);
}

class LoadHomePageEvent extends HomeEvent {}

class OnDeleteButtonPressEvent extends HomeEvent {
  final String id;

  OnDeleteButtonPressEvent(this.id);
}

class OnLogOutButtonPressEvent extends HomeEvent {}
