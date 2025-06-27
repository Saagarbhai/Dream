import 'package:dreamvila/core/utils/app_export.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsState(currentIndex: 0)) {
    on<ChangeIndexEvent>(_changeIndexEvent);
  }
  void _changeIndexEvent(ChangeIndexEvent event, Emitter emit) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
