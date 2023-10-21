import 'package:chatapp/models/contact.dart';

import 'package:get/get.dart';

class ContactPropertiesGet extends GetxController {
  Contact? contact;

  @override
  void onInit() {
    contact = Get.arguments;
    super.onInit();
  }

  void deleteChat() async {}
}
