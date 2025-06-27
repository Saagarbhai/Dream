import 'package:dreamvila/core/utils/app_export.dart';

class DetailsState extends Equatable {
  final Status detailPageStatus;
  final String errorMessage;
  final int currentIndex;

  const DetailsState(
      {this.detailPageStatus = Status.init,
      this.errorMessage = '',
      required this.currentIndex});
  DetailsState copyWith({
    Status? detailPageStatus,
    String? errorMessage,
    int? currentIndex,
  }) {
    return DetailsState(
        detailPageStatus: detailPageStatus ?? this.detailPageStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object?> get props => [detailPageStatus, errorMessage, currentIndex];
}
