import 'package:dreamvila/core/utils/app_export.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  final propertyRepositotry = PropertyRepositotry(ApiClient());

  DetailsBloc()
      : super(DetailsState(
          currentIndex: 0,
        )) {
    on<ChangeIndexEvent>(_changeIndexEvent);
    on<LoadProductDetailEvent>(_loadProductDetailEvent);
  }
  void _changeIndexEvent(ChangeIndexEvent event, Emitter emit) {
    try {
      emit(state.copyWith(currentIndex: event.index));
    } catch (e) {
      Logger.error("Error From ChangeIndexEvent : $e");
    }
  }

  void _loadProductDetailEvent(
      LoadProductDetailEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(detailPageStatus: Status.loading));
      final ProductFoundResponse response =
          await propertyRepositotry.getOnePropertyDetail(event.id);
      if (response.status == true) {
        emit(state.copyWith(detailPageStatus: Status.success, data: response));
      } else {
        emit(state.copyWith(detailPageStatus: Status.failure, data: response));
      }
    } catch (e) {
      Logger.error("Error From LoadProductDetailEvent : $e");
    }
  }
}
