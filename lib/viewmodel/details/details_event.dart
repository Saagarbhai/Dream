import 'package:dreamvila/core/utils/app_export.dart';

abstract class DetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ChangeIndexEvent extends DetailsEvent {
  final int index;
  ChangeIndexEvent(this.index);
}
