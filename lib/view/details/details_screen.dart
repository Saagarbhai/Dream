import '../../core/utils/app_export.dart';

class DetailsScreen extends StatelessWidget {
  static Widget builder(BuildContext context) {
    return DetailsScreen();
  }

  DetailsScreen({super.key});

  final List<String> images = [
    "assets/images/ic_cloud.png",
    "assets/images/ic_cloud.png",
    "assets/images/ic_cloud.png",
    "assets/images/ic_cloud.png"
  ];

  @override
  Widget build(BuildContext context) {
    final text = Lang.of(context);
    return Scaffold(
      body: BlocConsumer<DetailsBloc, DetailsState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 40.h),
                _build_Carousel_Slider(context),
                SizedBox(height: 10.h),
                _build_page_indicator(state, context),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 30.w),
                  child: _buildTextLarge(text.text_description, context),
                ),
                _build_Description(context, text),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _build_Description(BuildContext context, Lang text) {
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
              _buildTextMedium(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.",
                  context),
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
                      _buildTextWithPrimatyColor(text.text_location, context),
                      _buildTextWithPrimatyColor(text.text_price, context),
                      _buildTextWithPrimatyColor(
                          text.text_description, context),
                      _buildTextWithPrimatyColor(text.text_rating, context),
                      _buildTextWithPrimatyColor(text.text_type, context),
                      _buildTextWithPrimatyColor(text.text_plot, context),
                      _buildTextWithPrimatyColor(text.text_bedroom, context),
                      _buildTextWithPrimatyColor(text.text_hall, context),
                      _buildTextWithPrimatyColor(text.text_kitchen, context),
                      _buildTextWithPrimatyColor(text.text_washroom, context)
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

  SizedBox _build_page_indicator(DetailsState state, BuildContext context) {
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
                  shape: BoxShape.circle),
            );
          },
        ),
      ),
    );
  }

  CarouselSlider _build_Carousel_Slider(BuildContext context) {
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
