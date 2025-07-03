import '../../core/utils/app_export.dart';

class DetailsScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return DetailsScreen(id: '');
  }

  final String id;
  const DetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    if (id.isNotEmpty) {
      context.read<DetailsBloc>().add(LoadProductDetailEvent(id));
    }
    Logger.lOG(id);
    final text = Lang.of(context);

    return Scaffold(
      appBar: _buildAppBar(text, context),
      body: _build_Bloc_builder(text),
    );
  }

  AppBar _buildAppBar(Lang text, BuildContext context) {
    return AppBar(
        title: Text(
          text.title_details_Screen.toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        foregroundColor: Colors.white,
        backgroundColor: Theme.of(context).colorScheme.primary);
  }

  Widget _build_Bloc_builder(Lang text) {
    return BlocBuilder<DetailsBloc, DetailsState>(
      builder: (context, state) {
        if (id.isEmpty) {
          return _buildInvalidIdWidget(context);
        }

        if (state.detailPageStatus == Status.loading) {
          return const DetailsScreenShimmer();
        }

        if (state.detailPageStatus == Status.failure) {
          return _buildErrorWidget(context);
        }

        if (state.detailPageStatus == Status.success &&
            state.data?.data != null) {
          return _buildSuccessContent(context, state, text);
        }

        if (state.detailPageStatus == Status.success &&
            state.data?.data == null) {
          return _buildNoDataWidget(context);
        }

        return _buildEmptyStateWidget(context);
      },
    );
  }

  Widget _buildSuccessContent(
      BuildContext context, DetailsState state, Lang text) {
    final productData = state.data!.data!;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCarouselSlider(context, productData),
          SizedBox(height: 10.h),
          _buildPageIndicator(state, context, productData.images),
          SizedBox(height: 10.h),
          _buildTextSpan(context, productData, text),
          SizedBox(height: 10.h),
          Padding(
            padding: EdgeInsets.only(left: 30.w),
            child: _buildTextLarge(text.text_description, context),
          ),
          _buildPropertyDetail(context, productData)
        ],
      ),
    );
  }

  Widget _buildInvalidIdWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.warning_amber_outlined,
            size: 64.sp,
            color: Colors.deepOrange,
          ),
          SizedBox(height: 16.h),
          Text(
            Lang.of(context).error_lbl_invalid_property_id,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 8.h),
          Text(
            Lang.of(context).error_lbl_select_valid_property,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Lang.of(context).error_button_lbl_Go_Back),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 64.sp,
            color: Theme.of(context).colorScheme.error,
          ),
          SizedBox(height: 16.h),
          Text(
            Lang.of(context).error_lbl_failed_to_load_details,
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8.h),
          Text(
            Lang.of(context).error_lbl_check_your_conection,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () {
              context.read<DetailsBloc>().add(LoadProductDetailEvent(id));
            },
            child: Text(Lang.of(context).error_button_lbl_retry),
          ),
          SizedBox(height: 8.h),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Lang.of(context).error_button_lbl_Go_Back),
          ),
        ],
      ),
    );
  }

  Widget _buildNoDataWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.home_outlined,
            size: 64.sp,
            color: Theme.of(context).disabledColor,
          ),
          SizedBox(height: 16.h),
          Text(
            Lang.of(context).error_no_data_found,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 8.h),
          Text(
            Lang.of(context).error_no_longer_data_available,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 16.h),
          ElevatedButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Lang.of(context).error_button_lbl_Back_to_properties),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyStateWidget(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inbox_outlined,
            size: 64.sp,
            color: Theme.of(context).disabledColor,
          ),
          SizedBox(height: 16.h),
          Text(
            Lang.of(context).error_Something_went_wrong,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SizedBox(height: 16.h),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(Lang.of(context).error_button_lbl_Go_Back),
          ),
        ],
      ),
    );
  }

  Widget _buildTextSpan(
      BuildContext context, ProductFoundData productData, Lang text) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: RichText(
        text: TextSpan(
          style: TextStyle(overflow: TextOverflow.ellipsis),
          children: [
            TextSpan(
              text: text.lbl_limited_time,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 25.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            WidgetSpan(child: SizedBox(width: 8.w)),
            TextSpan(
              text: productData.title,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 25.sp,
                    fontWeight: FontWeight.bold,
                  ),
            ),
            WidgetSpan(child: SizedBox(width: 8.w)),
            TextSpan(
              text: text.lbl_is_coming_back,
              style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 25.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPropertyDetail(BuildContext context, ProductFoundData? product) {
    if (product == null) {
      return Center(
        child: Text(Lang.of(context).lbl_no_data_found),
      );
    }
    final Map<String, String> details = {
      "Location": product.address.toString(),
      "Price": "\$ ${product.price}",
      "Discount": "${product.discountPercentage} %",
      "Rating": "${product.rating} / 5",
      "Type": product.type.toString(),
      "Plots": "Plots ${product.plot}",
      "Bedroom": product.bedroom.toString(),
      "Hall": product.hall.toString(),
      "Kitchen": product.kitchen.toString(),
      "Washroom": product.washroom.toString(),
    };

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            color: Theme.of(context).customColors.secondaryColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r)),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.description.toString(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(height: 20.h),
                  Table(
                    columnWidths: const {
                      0: IntrinsicColumnWidth(),
                      1: FlexColumnWidth(),
                    },
                    defaultVerticalAlignment: TableCellVerticalAlignment.top,
                    children: details.entries.map((entry) {
                      return TableRow(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              "${entry.key} :",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(fontSize: 18.sp),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Text(
                              entry.value,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge!
                                  .copyWith(
                                      color:
                                          Theme.of(context).colorScheme.primary,
                                      fontSize: 18.sp),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 5,
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPageIndicator(
      DetailsState state, BuildContext context, List<String> images) {
    if (images.isEmpty) return SizedBox.shrink();

    return SizedBox(
      height: 10.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          images.length,
          (index) {
            return Container(
              height: 9.h,
              width: 9.w,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                color: state.currentIndex == index
                    ? Theme.of(context).customColors.primaryColor
                    : Colors.black38,
                shape: BoxShape.circle,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCarouselSlider(
      BuildContext context, ProductFoundData productData) {
    if (productData.images.isEmpty) {
      return SizedBox(
        height: 0.25.sh,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: Theme.of(context).customColors.secondaryColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.image_outlined,
                  size: 48.sp,
                  color: Theme.of(context).disabledColor,
                ),
                SizedBox(height: 8.h),
                Text(
                  Lang.of(context).lbl_no_data_found,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      );
    }

    return CarouselSlider(
      items: productData.images
          .map(
            (imageUrl) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Theme.of(context).customColors.secondaryColor,
              shadowColor: Theme.of(context).customColors.borderColor,
              child: AppImageView(
                imagePath: imageUrl,
                height: 190.h,
                width: 370.w,
                radius: BorderRadius.circular(10.r),
              ),
            ),
          )
          .toList(),
      options: CarouselOptions(
        height: 0.25.sh,
        aspectRatio: 16 / 9,
        viewportFraction: 1,
        initialPage: 0,
        enableInfiniteScroll: productData.images.length > 1,
        reverse: false,
        autoPlay: productData.images.length > 1,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 2000),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        enlargeFactor: 0.3,
        onPageChanged: (index, reason) {
          context.read<DetailsBloc>().add(ChangeIndexEvent(index));
        },
        scrollDirection: Axis.horizontal,
      ),
    );
  }

  Widget _buildTextLarge(String label, BuildContext context) {
    return Text(
      label,
      style: Theme.of(context)
          .textTheme
          .titleLarge!
          .copyWith(fontWeight: FontWeight.bold, fontSize: 18.sp),
    );
  }
}
