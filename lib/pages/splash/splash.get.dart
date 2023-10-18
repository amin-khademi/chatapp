
import 'package:chatapp/cacheManager/cacheManger.dart';
import 'package:chatapp/cacheManager/hive.cache.dart';
import 'package:chatapp/constants/config.dart';
import 'package:chatapp/init.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:chatapp/services/initServices.dart';
import 'package:chatapp/services/tokenFresher.service.dart';
import 'package:get/get.dart';

class SplashGet extends GetxController {
  @override
  void onInit() {
    _init();
    super.onInit();
  }

  void _init() async {
    await UserCacheManager.checkLogin();
    if (UserCacheManager.isUserLoggedIn) {
      
      Config.me = UserCacheManager.getUserData();
      // Refresh Token
      final service = TokenFresherService();
      await service
          .call({'userId': Config.me!.userId, 'userName': Config.me!.username});
      // Init Socket & HiveCache Manager
      AppInit().initSocketClient();
      // await HiveCacheManager().init();

      // Get latest offline messages
      // final offlineMsgServices = InitServices();
      // await offlineMsgServices.call({'userId': Config.me!.userId});

      // Route user to messages list
       Get.offAllNamed(PageRoutes.messages);
     
    } else {
      Get.offAllNamed(PageRoutes.welcome);
    }
  }
}