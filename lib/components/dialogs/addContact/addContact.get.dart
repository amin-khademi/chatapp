
import 'package:chatapp/cacheManager/hive.cache.dart';
import 'package:chatapp/constants/config.dart';
import 'package:chatapp/models/contact.dart';
import 'package:chatapp/pages/messages/view.get.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:chatapp/services/addContact.service.dart';
import 'package:get/get.dart';

class AddContactGet extends GetxController {
  var username = ''.obs;
  var loading = false.obs;

  void add() async {
    if (username.value.isEmpty) {
      Config.errorHandler(
          message: 'You have to enter a username!', title: 'Error');
      return;
    }
    if (!loading.value) {
      loading.value = true;
      final service = AddContactService();
      final result = await service.call({'username': username.value});
      loading.value = false;
      if (result != null) {

        //TODO  این اضافی هستش اینجا
        Get.back();
        Get.toNamed(PageRoutes.chat, arguments: result);
        final messagesGet = Get.find<MessagesGet>();
        await HiveCacheManager().save(Contact(user: result, messages: []));
        messagesGet.init();
        Get.back();
        Get.toNamed(PageRoutes.chat, arguments: result);
      }
    }
  }
}
