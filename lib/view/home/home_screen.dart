import 'dart:developer';
import 'package:dreamvila/core/utils/app_export.dart';

class HomeScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return const HomeScreen();
  }

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(LoadHomePageEvent());
    final text = Lang.of(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: Column(
                children: [
                  _buildHeader(text, context, state),
                  SizedBox(height: 10.h),
                  _buildTabView(context),
                  SizedBox(height: 10.h),
                  _build_property_list(context, state),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(Lang text, BuildContext context, HomeState state) {
    return Column(
      spacing: 10.sp,
      children: [
        SizedBox(height: 20.h),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [BoxShadow(blurRadius: 5, color: Colors.black45)],
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 3.w)),
              child: AppImageView(
                height: 100.h,
                width: 100.h,
                radius: BorderRadius.circular(10.r),
                imagePath: state.user?.data?.image != null
                    ? "${ApiEndPoint.userImageUrl}/${state.user!.data!.image}"
                    : null, // Handle null image
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildText(text.text_hello, context),
                SizedBox(height: 10.h),
                _buildText(
                    "${state.user?.data?.firstName ?? ''} ${state.user?.data?.lastName ?? ''}"
                        .trim(),
                    context),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildgreyText(state.user?.data?.email ?? '', context),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                border: Border.all(
                    color: Theme.of(context)
                        .customColors
                        .primaryColor
                        .withOpacity(0.25),
                    width: 1.w),
              ),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  try {
                    NavigatorService.pushNamed(AppRoutes.addUpdateRoute);
                  } catch (e) {
                    log(e.toString());
                  }
                },
                child: Text(
                  text.text_addProperty,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                      fontSize: 16.sp,
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget _buildText(String label, BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleLarge,
    );
  }

  Widget _buildgreyText(String label, BuildContext context) {
    return Text(
      label,
      style: Theme.of(context)
          .textTheme
          .titleSmall!
          .copyWith(color: Colors.grey.shade600, fontSize: 16.sp),
    );
  }

  Widget _buildTabView(BuildContext context) {
    return TabBar(
      onTap: (int value) {
        context.read<HomeBloc>().add(OnTabIndexChangeEvent(value));
      },
      labelColor: Theme.of(context).customColors.primaryColor,
      unselectedLabelColor: Colors.black,
      indicatorAnimation: TabIndicatorAnimation.elastic,
      labelPadding: EdgeInsets.all(0.h),
      overlayColor:
          WidgetStatePropertyAll(Theme.of(context).customColors.secondaryColor),
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      labelStyle:
          Theme.of(context).textTheme.labelLarge!.copyWith(fontSize: 16.sp),
      indicator: ShapeDecoration(
          color: Theme.of(context).customColors.secondaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          shadows: [
            BoxShadow(
                color: Theme.of(context).customColors.borderColor,
                offset: Offset(-1, 1),
                blurRadius: 5.r)
          ]),
      tabs: [
        Tab(text: Lang.of(context).lbl_house),
        Tab(text: Lang.of(context).lbl_apartment),
        Tab(text: Lang.of(context).lbl_office),
        Tab(text: Lang.of(context).lbl_land),
      ],
    );
  }

  Widget _build_property_list(BuildContext context, HomeState state) {
    final categoryFilter = ['house', 'apartment', 'office', 'land'];
    final filteredData = state.data?.data
        .where((e) => e.type == categoryFilter[state.index])
        .toList();

    return BlocBuilder<HomeBloc, HomeState>(
      buildWhen: (previous, current) =>
          previous.propertyStatus != current.propertyStatus ||
          previous.index != current.index,
      builder: (context, state) {
        if (state.propertyStatus == Status.loading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.propertyStatus == Status.success) {
          if (filteredData == null || filteredData.isEmpty) {
            return Expanded(
              child: Center(
                child: Text(
                  Lang.of(context).lbl_no_data_found,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Theme.of(context).customColors.primaryColor),
                ),
              ),
            );
          }
          return Expanded(
            child: ListView.builder(
              itemBuilder: (context, index) {
                final property = filteredData[index];
                return PropertyCard(
                  on_tap: () {
                    NavigatorService.pushNamed(AppRoutes.detailsRoute,
                        arguments: property.id);
                  },
                  imageUrl: property.images[0],
                  title: property.title,
                  address: property.address,
                  plots: property.plot,
                  discount: property.discountPercentage.toInt(),
                  rating: property.rating,
                  price: property.price.toInt(),
                  on_deletetap: () {
                    context
                        .read<HomeBloc>()
                        .add(OnDeleteButtonPressEvent(property.id));
                    FocusNode().unfocus();
                  },
                  on_updatetap: () {
                    NavigatorService.pushNamed(AppRoutes.addUpdateRoute,
                        arguments: {'isUpdate': true, 'data': property});
                    FocusNode().unfocus();
                  },
                );
              },
              itemCount: filteredData.length,
            ),
          );
        } else {
          return Center(
            child: Text(state.errorMessage),
          );
        }
      },
    );
  }
}
