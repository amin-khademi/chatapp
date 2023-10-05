import 'package:chatapp/cacheManager/cacheManger.dart';
import 'package:chatapp/constants/config.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:get/get.dart';

class SettingGet extends GetxController {
  void logOut() async {
    await UserCacheManager.clear();
    Config.me = null;
    Get.offNamed(PageRoutes.splash);
  }
}
