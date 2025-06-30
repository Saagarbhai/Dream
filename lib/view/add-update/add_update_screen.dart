import 'dart:developer';

import 'package:dreamvila/core/utils/app_export.dart';

class AddUpdateScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return AddUpdateScreen();
  }

  const AddUpdateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Lang.of(context);
    return Scaffold(body: BlocBuilder<AddupdateBloc, AddupdateState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 18.h),
            child: Column(
              spacing: 15.h,
              children: [
                SizedBox(height: 30.h),
                LabeledTextField(
                    label: text.lbl_Property_name,
                    hint: text.hint_name,
                    controller: state.titleController,
                    inputType: InputType.name),
                LabeledTextField(
                    label: text.lbl_Property_Description,
                    hint: text.text_description,
                    controller: state.descriptionController,
                    inputType: InputType.name,
                    maxLines: 3),
                LabeledTextField(
                    label: text.lbl_Property_Address,
                    hint: text.hint_address,
                    controller: state.addressController,
                    inputType: InputType.name,
                    maxLines: 3),
                LabeledTextField(
                    label: text.lbl_Property_Price,
                    hint: text.hint_price,
                    controller: state.priceController,
                    inputType: InputType.phoneNumber),
                LabeledTextField(
                    label: text.lbl_Property_DiscountPercentage,
                    hint: text.hint_discount,
                    controller: state.discountPercentageController,
                    inputType: InputType.phoneNumber),
                LabeledTextField(
                    label: text.lbl_property_Rating,
                    hint: text.hint_rating,
                    controller: state.ratingController,
                    inputType: InputType.phoneNumber),
                LabeledTextField(
                    label: text.lbl_Property_Plot,
                    hint: text.hint_plots,
                    controller: state.plotController,
                    inputType: InputType.phoneNumber),
                _buildDropdownInput(context, state),
                LabeledTextField(
                    label: text.lbl_Property_bedroom,
                    hint: text.hint_bedroom,
                    controller: state.bedroomController,
                    inputType: InputType.phoneNumber),
                LabeledTextField(
                    label: text.lbl_Property_hall,
                    hint: text.hint_hall,
                    controller: state.hallController,
                    inputType: InputType.phoneNumber),
                LabeledTextField(
                    label: text.lbl_Property_kitchen,
                    hint: text.hint_kitchen,
                    controller: state.kitchenController,
                    inputType: InputType.phoneNumber),
                LabeledTextField(
                    label: text.lbl_Property_Washroom,
                    hint: text.hint_washroom,
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
                    backgroundColor:
                        Theme.of(context).customColors.primaryColor,
                  ),
                  onPressed: () {
                    try {
                      NavigatorService.pushNamedAndRemoveUntil(
                          AppRoutes.homeRoute);
                    } catch (e) {
                      log(e.toString());
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    ));
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
