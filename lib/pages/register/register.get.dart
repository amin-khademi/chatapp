import 'package:chatapp/cacheManager/cacheManger.dart';
import 'package:chatapp/constants/config.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:chatapp/services/register.service.dart';
import 'package:get/get.dart';

class RegisterGet extends GetxController {
  var fullname = "".obs;
  var username = "".obs;
  var password = "".obs;

  var loading = false.obs;

  void createNewAcount() async {
    if (fullname.value.isEmpty ||
        username.value.isEmpty ||
        password.value.isEmpty) {
      Config.errorHandler(title: "error", message: "errr");
    } else {}

    if (!loading.value) {
      loading.value = true;
      try {
        final service = RegisterService();
        final result = await service.call({
          "fullname": fullname.value,
          "username": username.value,
          "password": password.value,
        });
        if (result) {
          Config.me = UserCacheManager.getUserData();

          Future.delayed(Duration(seconds: 3)).then((value) {
            Get.offAllNamed(PageRoutes.splash);
            loading.value = false;
          });
        }
      } catch (er) {
        Config.errorHandler(title: "Error", message: er.toString());
        loading.value = false;
      }
    }
  }
}
