import 'dart:developer';

import 'package:dreamvila/core/utils/app_export.dart';

class HomeScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return const HomeScreen();
  }

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final text = Lang.of(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            return SafeArea(
              minimum: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
              child: SingleChildScrollView(
                child: _Build_home_method(text, context),
              ),
            );
          },
        ),
      ),
    );
  }

  Column _Build_home_method(Lang text, BuildContext context) {
    return Column(
      spacing: 10.sp,
      children: [
        SizedBox(height: 20.h),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black12)],
                  color: Colors.white,
                  shape: BoxShape.rectangle,
                  border: Border.all(
                      color: Colors.white,
                      style: BorderStyle.solid,
                      width: 2.w)),
              child: AppImageView(
                height: 100.h,
                width: 100.h,
                imagePath: "assets/images/ic_cloud.png",
              ),
            ),
            Spacer(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                _buildText(text.text_hello, context),
                SizedBox(height: 10.h),
                _buildText(text.lbl_first_name, context),
              ],
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildgreyText(text.hint_email, context),
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
        _buildTabView(context),
        PropertyCard(
            imageUrl: 'assets/images/ic_cloud.png',
            title: 'title',
            address: "address",
            plots: 1,
            discount: 20,
            rating: 4.5,
            price: 202222),
        PropertyCard(
            imageUrl: 'assets/images/ic_cloud.png',
            title: 'title',
            address: "address",
            plots: 1,
            discount: 20,
            rating: 4.5,
            price: 202222),
        PropertyCard(
            imageUrl: 'assets/images/ic_cloud.png',
            title: 'title',
            address: "address",
            plots: 1,
            discount: 20,
            rating: 4.5,
            price: 202222),
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
          .copyWith(color: Colors.grey, fontSize: 16.sp),
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
}
