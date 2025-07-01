import 'package:dreamvila/core/utils/app_export.dart';

class AddUpdateScreen extends StatelessWidget {
  final bool isUpdate;
  final Property? property;

  const AddUpdateScreen({
    super.key,
    required this.isUpdate,
    this.property,
  });

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final bloc = context.read<AddupdateBloc>();
      if (isUpdate && !bloc.state.isInitialized) {
        bloc.add(UpdatebuttonpressedEvent(property!));
      } else if (!isUpdate && bloc.state.isInitialized) {
        bloc.add(DisposeEvent());
      }
    });
    final text = Lang.of(context);
    return WillPopScope(
      onWillPop: () async {
        context.read<AddupdateBloc>().add(DisposeEvent());
        return true;
      },
      child: Scaffold(body: BlocBuilder<AddupdateBloc, AddupdateState>(
        builder: (context, state) {
          return _buil_text_fields(state, text, context);
        },
      )),
    );
  }

  Widget _buil_text_fields(
      AddupdateState state, Lang text, BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
        child: Form(
          key: state.formKey,
          child: Column(
            spacing: 15.h,
            children: [
              SizedBox(height: 30.h),
              LabeledTextField(
                  label: text.lbl_Property_name,
                  hint: text.hint_name,
                  maxLenth: 30,
                  controller: state.titleController,
                  inputType: InputType.name),
              LabeledTextField(
                  label: text.lbl_Property_Description,
                  hint: text.text_description,
                  maxLenth: 100,
                  controller: state.descriptionController,
                  inputType: InputType.name,
                  maxLines: 3),
              LabeledTextField(
                  label: text.lbl_Property_Address,
                  hint: text.hint_address,
                  maxLenth: 100,
                  controller: state.addressController,
                  inputType: InputType.name,
                  maxLines: 3),
              LabeledTextField(
                  label: text.lbl_Property_Price,
                  hint: text.hint_price,
                  maxLenth: 9,
                  controller: state.priceController,
                  inputType: InputType.phoneNumber),
              LabeledTextField(
                  label: text.lbl_Property_DiscountPercentage,
                  hint: text.hint_discount,
                  maxLenth: 2,
                  controller: state.discountPercentageController,
                  inputType: InputType.phoneNumber),
              LabeledTextField(
                  label: text.lbl_property_Rating,
                  hint: text.hint_rating,
                  maxLenth: 3,
                  controller: state.ratingController,
                  inputType: InputType.phoneNumber),
              LabeledTextField(
                  label: text.lbl_Property_Plot,
                  hint: text.hint_plots,
                  maxLenth: 2,
                  controller: state.plotController,
                  inputType: InputType.phoneNumber),
              _buildDropdownInput(context, state),
              LabeledTextField(
                  label: text.lbl_Property_bedroom,
                  hint: text.hint_bedroom,
                  maxLenth: 2,
                  controller: state.bedroomController,
                  inputType: InputType.phoneNumber),
              LabeledTextField(
                  label: text.lbl_Property_hall,
                  hint: text.hint_hall,
                  maxLenth: 2,
                  controller: state.hallController,
                  inputType: InputType.phoneNumber),
              LabeledTextField(
                  label: text.lbl_Property_kitchen,
                  hint: text.hint_kitchen,
                  maxLenth: 2,
                  controller: state.kitchenController,
                  inputType: InputType.phoneNumber),
              LabeledTextField(
                  label: text.lbl_Property_Washroom,
                  hint: text.hint_washroom,
                  maxLenth: 2,
                  controller: state.washroomController,
                  inputType: InputType.phoneNumber),
              CustomImagePickerField(
                label: Lang.of(context).lbl_Property_image,
                images: state.images,
                onAddTap: () => context.read<AddupdateBloc>().add(
                      AddImagesEvent(),
                    ),
                onRemoveTap: (index) => context.read<AddupdateBloc>().add(
                      CancelImageEvent(index),
                    ),
              ),
              SizedBox(),
              CustomElevatedButton(
                text: text.lbl_on_submit,
                buttonTextStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold),
                buttonStyle: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).customColors.primaryColor,
                ),
                onPressed: () {
                  if (state.formKey.currentState!.validate()) {
                    context.read<AddupdateBloc>().add(
                          OnSubmitbuttonpressedEvent(isUpdate,
                              id: property?.id),
                        );
                  }
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownInput(BuildContext context, AddupdateState state) {
    const types = ['house', 'apartment', 'office', 'land'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Lang.of(context).lbl_Property_type,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        SizedBox(height: 5.h),
        DropdownButtonFormField2<String>(
          value: state.selectedType,
          isExpanded: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 10),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
          items: types.map((type) {
            return DropdownMenuItem(
              value: type,
              child: Text(
                type,
                overflow: TextOverflow.ellipsis,
              ),
            );
          }).toList(),
          onChanged: (value) {
            if (value != null) {
              context.read<AddupdateBloc>().add(
                    DropDownChangedEvent(value),
                  );
            }
          },
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),
        ),
      ],
    );
  }
}
