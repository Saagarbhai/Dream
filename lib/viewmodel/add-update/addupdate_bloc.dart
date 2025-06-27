import 'package:dreamvila/core/utils/app_export.dart';

class AddupdateBloc extends Bloc<AddupdateEvent, AddupdateState> {
  AddupdateBloc() : super(AddupdateInitial()) {
    on<AddupdateEvent>((event, emit) {});
  }
}
