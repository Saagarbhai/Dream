import 'dart:developer';
import 'package:dreamvila/core/utils/app_export.dart';

class ImagePickerUtils {
  final ImagePicker imagePicker = ImagePicker();

  Future<XFile?> PickImageFromGallary() async {
    final XFile? file =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      return file;
    } else {
      return null;
    }
  }

  Future<List<XFile>?> pickMultipleImageFromGallery() async {
    try {
      final pickedFiles = await ImagePicker().pickMultiImage();
      if (pickedFiles.isNotEmpty) {
        return pickedFiles;
      }
      return null;
    } catch (e) {
      log("Image picker error: $e");
      return null;
    }
  }
}
