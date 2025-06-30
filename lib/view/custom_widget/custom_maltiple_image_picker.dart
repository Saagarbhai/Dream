import 'package:dreamvila/core/utils/app_export.dart';

class CustomImagePickerField extends StatelessWidget {
  final String label;
  final List<String> images;
  final VoidCallback onAddTap;
  final void Function(int) onRemoveTap;

  const CustomImagePickerField({
    super.key,
    required this.label,
    required this.images,
    required this.onAddTap,
    required this.onRemoveTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.bodyLarge),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: onAddTap,
          child: DottedBorder(
            color: Colors.grey,
            borderType: BorderType.RRect,
            radius: const Radius.circular(12),
            dashPattern: const [8, 4],
            child: Container(
              height: 150.h,
              width: double.infinity,
              alignment: Alignment.center,
              child: images.isEmpty
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset("assets/images/ic_cloud.png", height: 90.h),
                        SizedBox(height: 10.h),
                        const Text("Select Images"),
                      ],
                    )
                  : SizedBox(
                      height: 150.h,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemCount: images.length,
                        separatorBuilder: (_, __) => SizedBox(width: 10.w),
                        itemBuilder: (context, index) => Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(10.r),
                              child: Image.file(
                                File(images[index]),
                                height: 150.h,
                                width: 150.w,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: IconButton(
                                icon: Icon(Icons.cancel_outlined,
                                    color:
                                        Theme.of(context).colorScheme.primary),
                                onPressed: () => onRemoveTap(index),
                              ),
                            ),
                            Positioned(
                              top: 15,
                              left: 15,
                              child: CircleAvatar(
                                radius: 10.r,
                                backgroundColor: Theme.of(context)
                                    .colorScheme
                                    .primary
                                    .withOpacity(0.5),
                                child: Center(
                                  child: Text(
                                    (index + 1).toString(),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 13),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
