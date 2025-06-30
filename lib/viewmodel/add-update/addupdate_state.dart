import 'package:dreamvila/core/utils/app_export.dart';

class AddupdateState extends Equatable {
  final GlobalKey<FormState> formKey;

  final TextEditingController titleController;
  final TextEditingController descriptionController;
  final TextEditingController addressController;
  final TextEditingController priceController;
  final TextEditingController discountPercentageController;
  final TextEditingController ratingController;
  final TextEditingController plotController;
  final TextEditingController typeController;
  final TextEditingController bedroomController;
  final TextEditingController hallController;
  final TextEditingController kitchenController;
  final TextEditingController washroomController;

  final String selectedType;
  final List<String> images;
  final String? thumbnail;

  final bool isInitialized;
  final Status addProductStatus;
  final String errorMessage;

  const AddupdateState({
    required this.formKey,
    required this.titleController,
    required this.descriptionController,
    required this.addressController,
    required this.priceController,
    required this.discountPercentageController,
    required this.ratingController,
    required this.plotController,
    required this.typeController,
    required this.bedroomController,
    required this.hallController,
    required this.kitchenController,
    required this.washroomController,
    this.selectedType = 'house',
    this.images = const [],
    this.thumbnail,
    this.isInitialized = false,
    this.addProductStatus = Status.init,
    this.errorMessage = '',
  });

  factory AddupdateState.initial() => AddupdateState(
        formKey: GlobalKey<FormState>(),
        titleController: TextEditingController(),
        descriptionController: TextEditingController(),
        addressController: TextEditingController(),
        priceController: TextEditingController(),
        discountPercentageController: TextEditingController(),
        ratingController: TextEditingController(),
        plotController: TextEditingController(),
        typeController: TextEditingController(),
        bedroomController: TextEditingController(),
        hallController: TextEditingController(),
        kitchenController: TextEditingController(),
        washroomController: TextEditingController(),
      );

  AddupdateState copyWith({
    String? selectedType,
    List<String>? images,
    String? thumbnail,
    bool? isInitialized,
    Status? addProductStatus,
    String? errorMessage,
  }) =>
      AddupdateState(
        formKey: formKey,
        titleController: titleController,
        descriptionController: descriptionController,
        addressController: addressController,
        priceController: priceController,
        discountPercentageController: discountPercentageController,
        ratingController: ratingController,
        plotController: plotController,
        typeController: typeController,
        bedroomController: bedroomController,
        hallController: hallController,
        kitchenController: kitchenController,
        washroomController: washroomController,
        selectedType: selectedType ?? this.selectedType,
        images: images ?? this.images,
        thumbnail: thumbnail ?? this.thumbnail,
        isInitialized: isInitialized ?? this.isInitialized,
        addProductStatus: addProductStatus ?? this.addProductStatus,
        errorMessage: errorMessage ?? this.errorMessage,
      );

  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    addressController.dispose();
    priceController.dispose();
    discountPercentageController.dispose();
    ratingController.dispose();
    plotController.dispose();
    typeController.dispose();
    bedroomController.dispose();
    hallController.dispose();
    kitchenController.dispose();
    washroomController.dispose();
  }

  @override
  List<Object?> get props => [
        formKey,
        titleController,
        descriptionController,
        addressController,
        priceController,
        discountPercentageController,
        ratingController,
        plotController,
        typeController,
        bedroomController,
        hallController,
        kitchenController,
        washroomController,
        selectedType,
        images,
        thumbnail,
        isInitialized,
        addProductStatus,
        errorMessage,
      ];
}
