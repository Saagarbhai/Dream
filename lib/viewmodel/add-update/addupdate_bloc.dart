import 'package:dreamvila/core/utils/app_export.dart';

class AddupdateBloc extends Bloc<AddupdateEvent, AddupdateState> {
  AddupdateBloc() : super(AddupdateState.initial()) {
    on<DropDownChangedEvent>(_onDropDownChanged);
    on<AddImagesEvent>(_onAddImages);
    on<CancelImageEvent>(_onCancelImage);
  }
  void _onDropDownChanged(DropDownChangedEvent event, Emitter emit) {
    state.typeController.text = event.type;
    emit(state.copyWith(selectedType: event.type));
  }

  Future<void> _onAddImages(AddImagesEvent event, Emitter emit) async {
    final files = await ImagePickerUtils().pickMultipleImageFromGallery();
    if (files != null && files.isNotEmpty) {
      final paths = files.map((e) => e.path).toList();
      emit(state.copyWith(
        images: [...state.images, ...paths],
        thumbnail: state.thumbnail ?? paths.first,
      ));
    }
  }

  void _onCancelImage(CancelImageEvent event, Emitter emit) {
    final updated = List<String>.from(state.images);
    updated.removeAt(event.index);
    emit(state.copyWith(images: updated));
  }
}
