import 'package:dreamvila/core/utils/app_export.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final SharedPreferencesService sharedPreferencesService =
      SharedPreferencesService();
  final homeRepositry = HomeRepositry(ApiClient());
  final propertyRepositotry = PropertyRepositotry(ApiClient());
  HomeBloc() : super(HomeState(index: 0)) {
    on<OnTabIndexChangeEvent>(_onTabIndexChangeEvent);
    on<LoadHomePageEvent>(_loadHomePageEvent);
    on<OnDeleteButtonPressEvent>(_onDeleteButtonPressEvent);
    on<OnLogOutButtonPressEvent>(_onLogOutButtonPressEvent);
  }

  void _onTabIndexChangeEvent(OnTabIndexChangeEvent event, Emitter emit) {
    try {
      emit(state.copyWith(index: event.index));
    } catch (e) {
      Logger.error("Error From OnTabIndexChangeEvent : $e");
    }
  }

  void _loadHomePageEvent(LoadHomePageEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(homeStatus: Status.loading));
      final PropertyModel data = await propertyRepositotry.getAllPropertyData();
      final UserDetailResponse user = await homeRepositry.getUserRepo();
      if (data.status == true) {
        emit(state.copyWith(
            homeStatus: Status.success,
            propertyStatus: Status.success,
            data: data,
            user: user));
      } else {
        emit(state.copyWith(
            homeStatus: Status.failure, errorMessage: data.message));
      }
    } catch (e) {
      Logger.error("Error From LoadHomePageEvent : $e");
    }
  }

  void _onDeleteButtonPressEvent(
      OnDeleteButtonPressEvent event, Emitter emit) async {
    try {
      emit(state.copyWith(propertyStatus: Status.loading));
      final result = await propertyRepositotry.deleteProperty(event.id);
      if (result.status == true) {
        final PropertyModel data =
            await propertyRepositotry.getAllPropertyData();
        if (data.status == true) {
          emit(state.copyWith(propertyStatus: Status.success, data: data));
        } else {
          emit(state.copyWith(
              propertyStatus: Status.failure, errorMessage: data.message));
        }
      } else {
        emit(state.copyWith(
            propertyStatus: Status.failure, errorMessage: 'error'));
      }
    } catch (e) {
      Logger.error("Error From OnDeleteButtonPressEvent : $e");
    }
  }

  void _onLogOutButtonPressEvent(OnLogOutButtonPressEvent event, Emitter emit) {
    try {
      sharedPreferencesService.storeUserIsLogin(false);
    } catch (e) {
      Logger.error("Error From OnLogOutButtonPressEvent $e");
    }
  }
}
