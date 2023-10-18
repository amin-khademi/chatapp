import 'package:chatapp/cacheManager/cacheManger.dart';
import 'package:chatapp/constants/config.dart';
import 'package:chatapp/init.dart';
import 'package:chatapp/route_manager/page_route.dart';
// import 'package:chatapp/services/tokenFresher.service.dart';
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
      // // refresh token
      // final service = TokenFresherService();
      // await service
      //     .call({"userId": Config.me!.userId, "userName": Config.me!.username});
      Config.me = UserCacheManager.getUserData();
      AppInit().initSocketClient();
      Future.delayed(Duration(seconds: 2))
          .then((value) => Get.offAllNamed(PageRoutes.messages));
    } else {
      Future.delayed(Duration(seconds: 2))
          .then((value) => Get.offAllNamed(PageRoutes.welcome));
    }
  }
}
