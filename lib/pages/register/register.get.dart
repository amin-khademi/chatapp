import 'package:chatapp/constants/config.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:chatapp/services/register.service.dart';
import 'package:flutter/cupertino.dart';
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

        loading.value = false;
        Get.offAllNamed(PageRoutes.messages);
      } catch (er) {
        Config.errorHandler(title: "Error", message: er.toString());
        loading.value = false;
      }
    }
  }
}
