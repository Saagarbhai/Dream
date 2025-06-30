import 'package:dreamvila/core/utils/app_export.dart';

abstract class AddupdateEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class DropDownChangedEvent extends AddupdateEvent {
  final String type;
  DropDownChangedEvent(this.type);
  @override
  List<Object> get props => [type];
}

class AddImagesEvent extends AddupdateEvent {}

class CancelImageEvent extends AddupdateEvent {
  final int index;
  CancelImageEvent(this.index);
  @override
  List<Object> get props => [index];
}
