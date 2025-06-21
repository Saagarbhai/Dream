import '../../core/utils/app_export.dart';

class AppImageView extends StatelessWidget {
  final String? imagePath;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final Alignment? alignment;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? radius;
  final BoxBorder? border;
  final BlendMode? colorBlendMode;

  const AppImageView({
    super.key,
    this.imagePath,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.alignment,
    this.onTap,
    this.radius,
    this.margin,
    this.border,
    this.colorBlendMode,
  });

  @override
  Widget build(BuildContext context) {
    return alignment != null
        ? Align(alignment: alignment!, child: _buildWidget())
        : _buildWidget();
  }

  Widget _buildWidget() {
    return Padding(
        padding: margin ?? EdgeInsets.zero,
        child: InkWell(onTap: onTap, child: _buildCircleImage()));
  }

  _buildCircleImage() {
    if (radius != null) {
      return ClipRRect(
          borderRadius: radius ?? BorderRadius.zero,
          child: _buildImageWithBorder());
    } else {
      return _buildImageWithBorder();
    }
  }

  _buildImageWithBorder() {
    if (border != null) {
      return Container(
          decoration: BoxDecoration(border: border, borderRadius: radius),
          child: _buildImageView());
    } else {
      return _buildImageView();
    }
  }

  Widget _buildImageView() {
    if (imagePath != null) {
      switch (imagePath!.imageType) {
        case ImageType.svg:
          return SizedBox(
            height: height,
            width: width,
            child: SvgPicture.asset(imagePath!,
                height: height,
                width: width,
                fit: fit ?? BoxFit.contain,
                color: color),
          );
        case ImageType.file:
          return Image.file(File(imagePath!),
              height: height,
              width: width,
              fit: fit ?? BoxFit.cover,
              color: color);
        case ImageType.network:
          return CachedNetworkImage(
            height: height,
            width: width,
            fit: fit,
            imageUrl: imagePath!,
            filterQuality: FilterQuality.high,
            color: color,
            repeat: ImageRepeat.noRepeat,
            placeholderFadeInDuration: const Duration(milliseconds: 300),
            fadeInDuration: const Duration(milliseconds: 300),
            fadeOutDuration: const Duration(milliseconds: 300),
            colorBlendMode: BlendMode.overlay,
            fadeOutCurve: Curves.bounceOut,
            placeholder: (context, url) => Shimmer.fromColors(
              baseColor: Colors.grey.shade200,
              highlightColor: Colors.grey.shade50,
              child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(color: Colors.grey.shade200)),
            ),
            cacheManager: CacheManager(Config('CHAT',
                stalePeriod: const Duration(days: 1),
                maxNrOfCacheObjects: 1000)),
            errorWidget: (context, url, error) => AppImageView(
              imagePath: 'assets/images/error/pngNotFound.svg',
              height: height,
              width: width,
              fit: fit ?? BoxFit.cover,
            ),
          );
        case ImageType.lottie:
          return Lottie.asset(imagePath!,
              height: height, width: width, fit: fit ?? BoxFit.cover);
        case ImageType.png:
        default:
          return Image.asset(
            imagePath!,
            height: height,
            width: width,
            fit: fit ?? BoxFit.cover,
            color: color,
            filterQuality: FilterQuality.high,
            gaplessPlayback: true,
            alignment: Alignment.center,
          );
      }
    }
    return const SizedBox.shrink();
  }
}

extension ImageTypeExtension on String {
  ImageType get imageType {
    if (startsWith('http') || startsWith('https')) {
      return ImageType.network;
    } else if (endsWith('.svg')) {
      return ImageType.svg;
    } else if (endsWith('.json')) {
      return ImageType.lottie;
    } else if (startsWith('/data') || startsWith('/storage')) {
      return ImageType.file;
    } else {
      return ImageType.png;
    }
  }
}

enum ImageType { svg, png, network, file, lottie, unknown }
