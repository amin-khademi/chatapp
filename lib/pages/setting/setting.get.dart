import 'package:chatapp/cacheManager/cache.manger.dart';
import 'package:chatapp/cacheManager/hive.cache.dart';
import 'package:chatapp/constants/config.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:get/get.dart';

class SettingGet extends GetxController {
  void logOut() async {
    await UserCacheManager.clear();
    await HiveCacheManager().clearAll();
    Config.me = null;
    Get.offNamed(PageRoutes.splash);
  }
}
