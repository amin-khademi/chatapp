import 'package:chatapp/cacheManager/cacheManger.dart';
import 'package:chatapp/constants/config.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:chatapp/services/login.service.dart';
import 'package:get/get.dart';

class LoginGet extends GetxController {
  var username = "".obs;
  var password = "".obs;

  var loading = false.obs;

  void loginToAcount() async {
    if (username.value.isEmpty || password.value.isEmpty) {
      Config.errorHandler(
          title: "Empty field", message: "please enter all the fields.");
      Future.delayed(Duration(seconds: 2))
          .then((value) => loading.value = false);
      update();
    } else {}

    if (!loading.value) {
      loading.value = true;
      try {
        final service = LoginService();
        final result = await service.call({
          "username": username.value,
          "password": password.value,
        });
        if (result) {
          Config.me = UserCacheManager.getUserData();
          Future.delayed(Duration(seconds: 2)).then((value) {
            Get.offAllNamed(PageRoutes.splash);
            loading.value = false;
          });
        } else {
          Future.delayed(Duration(seconds: 2))
          .then((value) => loading.value = false);
        }
      } catch (er) {
        Config.errorHandler(title: "Error", message: er.toString());
      }
    }
  }
}
