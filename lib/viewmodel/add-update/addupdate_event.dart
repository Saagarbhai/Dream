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

class OnSubmitbuttonpressedEvent extends AddupdateEvent {
  final bool isUpdate;
  final String? id;
  OnSubmitbuttonpressedEvent(this.isUpdate, {this.id});
  @override
  List<Object?> get props => [isUpdate, id];
}

class UpdatebuttonpressedEvent extends AddupdateEvent {
  final Property property;
  UpdatebuttonpressedEvent(this.property);
  @override
  List<Object> get props => [property];
}

class DisposeEvent extends AddupdateEvent {}

class RatingChangedEvent extends AddupdateEvent {
  final double rating;

  RatingChangedEvent(this.rating);
}
