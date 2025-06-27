import 'package:dreamvila/core/utils/app_export.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState(index: 0)) {
    on<OnTabIndexChangeEvent>(_onTabIndexChangeEvent);
  }

  void _onTabIndexChangeEvent(OnTabIndexChangeEvent event, Emitter emit) {
    emit(state.copyWith(index: event.index));
  }
}
