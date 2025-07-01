import '../../core/utils/app_export.dart';

class DetailsScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return DetailsScreen(id: '');
  }

  final String id;
  const DetailsScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<DetailsBloc>().add(LoadProductDetailEvent(id));
    final text = Lang.of(context);
    return Scaffold(
      body: BlocBuilder<DetailsBloc, DetailsState>(
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                _build_Carousel_Slider(context, state),
                SizedBox(height: 10.h),
                _build_Text_Span(context, state),
                SizedBox(height: 10.h),
                _build_page_indicator(state, context),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: _buildTextLarge(text.text_description, context),
                ),
                _build_Description(context, text, state),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _build_Text_Span(BuildContext context, DetailsState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: RichText(
        text: TextSpan(
            style: TextStyle(overflow: TextOverflow.ellipsis),
            children: [
              TextSpan(
                text: Lang.of(context).lbl_limited_time,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 25.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold),
              ),
              WidgetSpan(child: SizedBox(width: 8.w)),
              TextSpan(
                text: state.data?.data?.title,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 25.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              WidgetSpan(child: SizedBox(width: 8.w)),
              TextSpan(
                text: Lang.of(context).lbl_is_coming_back,
                style: Theme.of(context).textTheme.labelLarge!.copyWith(
                    fontSize: 25.sp,
                    fontFamily: GoogleFonts.poppins().fontFamily,
                    fontWeight: FontWeight.bold),
              ),
            ]),
      ),
    );
  }

  Widget _build_Description(
      BuildContext context, Lang text, DetailsState state) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Card(
        child: Container(
          width: 0.95.sw,
          margin:
              EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 15.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextMedium(state.data!.data!.description, context),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15.h,
                    children: [
                      _buildTextLarge(text.text_location, context),
                      _buildTextLarge(text.text_price, context),
                      _buildTextLarge(text.text_description, context),
                      _buildTextLarge(text.text_rating, context),
                      _buildTextLarge(text.text_type, context),
                      _buildTextLarge(text.text_plot, context),
                      _buildTextLarge(text.text_bedroom, context),
                      _buildTextLarge(text.text_hall, context),
                      _buildTextLarge(text.text_kitchen, context),
                      _buildTextLarge(text.text_washroom, context)
                    ],
                  ),
                  SizedBox(width: 20.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    spacing: 15.h,
                    children: [
                      _buildTextWithPrimatyColor(
                          state.data!.data!.address, context),
                      _buildTextWithPrimatyColor(
                          '\$ ${state.data!.data!.price.toString()}', context),
                      _buildTextWithPrimatyColor(
                          state.data!.data!.description, context),
                      _buildTextWithPrimatyColor(
                          state.data!.data!.rating.toString(), context),
                      _buildTextWithPrimatyColor(
                          state.data!.data!.type, context),
                      _buildTextWithPrimatyColor(
                          state.data!.data!.plot.toString(), context),
                      _buildTextWithPrimatyColor(
                          state.data!.data!.bedroom.toString(), context),
                      _buildTextWithPrimatyColor(
                          state.data!.data!.hall.toString(), context),
                      _buildTextWithPrimatyColor(
                          state.data!.data!.kitchen.toString(), context),
                      _buildTextWithPrimatyColor(
                          state.data!.data!.washroom.toString(), context)
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _build_page_indicator(DetailsState state, BuildContext context) {
    return SizedBox(
      height: 10.h,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          state.data!.data!.images.length,
          (index) {
            return Container(
              height: 9.h,
              width: 9.w,
              margin: EdgeInsets.symmetric(horizontal: 4.w),
              decoration: BoxDecoration(
                  color: state.currentIndex == index
                      ? Theme.of(context).customColors.primaryColor
                      : Colors.black38,
                  shape: BoxShape.circle),
            );
          },
        ),
      ),
    );
  }

  Widget _build_Carousel_Slider(BuildContext context, DetailsState state) {
    final List<String> images = state.data!.data!.images;
    return CarouselSlider(
      items: images
          .map(
            (e) => Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              color: Theme.of(context).customColors.secondaryColor,
              shadowColor: Theme.of(context).customColors.borderColor,
              child: AppImageView(
                imagePath: e.toString(),
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
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: true,
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

  Widget _buildTextMedium(String label, BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16.sp),
    );
  }

  Widget _buildTextWithPrimatyColor(String label, BuildContext context) {
    return Text(
      label,
      style: Theme.of(context).textTheme.titleLarge!.copyWith(
          color: Theme.of(context).colorScheme.primary, fontSize: 18.sp),
    );
  }
}
