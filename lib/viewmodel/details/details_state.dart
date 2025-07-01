import 'package:dreamvila/core/utils/app_export.dart';

class DetailsState extends Equatable {
  final Status detailPageStatus;
  final ProductFoundResponse? data;
  final String errorMessage;
  final int currentIndex;

  const DetailsState(
      {this.detailPageStatus = Status.init,
      this.errorMessage = '',
      this.data,
      required this.currentIndex});
  DetailsState copyWith({
    Status? detailPageStatus,
    String? errorMessage,
    ProductFoundResponse? data,
    int? currentIndex,
  }) {
    return DetailsState(
        detailPageStatus: detailPageStatus ?? this.detailPageStatus,
        errorMessage: errorMessage ?? this.errorMessage,
        data: data ?? this.data,
        currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object?> get props =>
      [detailPageStatus, data, errorMessage, currentIndex];
}
