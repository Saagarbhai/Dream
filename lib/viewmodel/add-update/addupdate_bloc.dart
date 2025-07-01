import 'package:dreamvila/core/utils/app_export.dart';

class AddupdateBloc extends Bloc<AddupdateEvent, AddupdateState> {
  final productRepository = PropertyRepositotry(ApiClient());
  final imagePickerUtils = ImagePickerUtils();

  AddupdateBloc() : super(AddupdateState.initial()) {
    on<DropDownChangedEvent>(_onDropDownChanged);
    on<AddImagesEvent>(_onAddImages);
    on<CancelImageEvent>(_onCancelImage);
    on<OnSubmitbuttonpressedEvent>(_onSubmitButtonPressedEvent);
    on<UpdatebuttonpressedEvent>(_onUpdatebuttonpressedEvent);
    on<DisposeEvent>(_onDispose);
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

  Future<void> _onSubmitButtonPressedEvent(
      OnSubmitbuttonpressedEvent event, Emitter emit) async {
    emit(state.copyWith(addProductStatus: Status.loading));

    final Map<String, dynamic> property = {
      "title": state.titleController.text,
      "description": state.descriptionController.text,
      "address": state.addressController.text,
      "price": double.tryParse(state.priceController.text) ?? 0,
      "discountPercentage":
          double.tryParse(state.discountPercentageController.text) ?? 0,
      "rating": double.tryParse(state.ratingController.text) ?? 0,
      "plot": int.tryParse(state.plotController.text) ?? 0,
      "type": state.selectedType,
      "bedroom": int.tryParse(state.bedroomController.text) ?? 0,
      "hall": int.tryParse(state.hallController.text) ?? 0,
      "kitchen": int.tryParse(state.kitchenController.text) ?? 0,
      "washroom": int.tryParse(state.washroomController.text) ?? 0,
      "thumbnail": state.thumbnail ?? '',
      "images": state.images,
    };

    final result = event.isUpdate
        ? await productRepository.updateProperty(property, event.id!)
        : await productRepository.addProperty(property);

    if (result.status == true) {
      emit(state.copyWith(addProductStatus: Status.success));
      add(DisposeEvent());
      NavigatorService.pushNamedAndRemoveUntil(AppRoutes.homeRoute);
    } else {
      emit(state.copyWith(
        addProductStatus: Status.failure,
        errorMessage: result.message,
      ));
    }
  }

  void _onUpdatebuttonpressedEvent(
      UpdatebuttonpressedEvent event, Emitter emit) {
    if (!state.isInitialized) {
      state.titleController.text = event.property.title;
      state.descriptionController.text = event.property.description;
      state.addressController.text = event.property.address;
      state.priceController.text = event.property.price.toString();
      state.discountPercentageController.text =
          event.property.discountPercentage.toString();
      state.ratingController.text = event.property.rating.toString();
      state.plotController.text = event.property.plot.toString();
      state.typeController.text = event.property.type;
      state.bedroomController.text = event.property.bedroom.toString();
      state.hallController.text = event.property.hall.toString();
      state.kitchenController.text = event.property.kitchen.toString();
      state.washroomController.text = event.property.washroom.toString();

      emit(state.copyWith(
        images: event.property.images,
        thumbnail: event.property.thumbnail,
        selectedType: event.property.type,
        isInitialized: true,
      ));
    }
  }

  void _onDispose(DisposeEvent event, Emitter emit) {
    state.dispose();
    emit(AddupdateState.initial());
  }
}
