import 'dart:io';
import 'package:chatapp/cacheManager/cache.manger.dart';
import 'package:chatapp/cacheManager/hive.cache.dart';
import 'package:chatapp/constants/config.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:chatapp/services/upload.Services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class SettingGet extends GetxController {
  Rx<File?> profileAvatar = File("").obs;

  void uploadAvatar() async {
    final imagePicker = ImagePicker();
    final XFile? pickedFile = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 60,
        maxHeight: 300,
        maxWidth: 300);

    if (pickedFile != null) {
      final uploadService = UploadServices();
      final uploadResult = await uploadService
          .call({'userId': Config.me!.userId, 'avatar': pickedFile.path});

      if (uploadResult) {
        profileAvatar.value = File(pickedFile.path);
      }
    }
  }

  void logOut() async {
    await UserCacheManager.clear();
    await HiveCacheManager().clearAll();
    Config.me = null;
    Get.offNamed(PageRoutes.splash);
  }
}
