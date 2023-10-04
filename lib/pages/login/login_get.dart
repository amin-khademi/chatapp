import 'package:chatapp/constants/config.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:chatapp/services/login.dart';
import 'package:get/get.dart';

class LoginGet extends GetxController {
  var fullname = "".obs;
  var username = "".obs;
  var password = "".obs;

  var loading = false.obs;

  void loginToAcount() async {
    if (fullname.value.isEmpty ||
        username.value.isEmpty ||
        password.value.isEmpty) {
      Config.errorHandler(title: "Empty field", message: "please enter all the fields.");
    } else {}

    if (!loading.value) {
      loading.value = true;
      try {
        final service = LoginService();
        final result = await service.call({
          "fullname": fullname.value,
          "username": username.value,
          "password": password.value,
        });

        loading.value = false;
        Get.offAllNamed(PageRoutes.messages);
      } catch (er) {
        Config.errorHandler(title: "Error", message: er.toString());
        loading.value = false;
      }
    }
  }
}
