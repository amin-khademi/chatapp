import 'package:chatapp/constants/config.dart';
import 'package:chatapp/services/register.service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class RegisterGet extends GetxController {
  var fullname = "".obs;
  var username = "".obs;
  var password = "".obs;

  var loading = false.obs;

  void createNewAcount() async {
    if (!loading.value) {
      loading.value = true;
      try {
        final service = RegisterService();
        final result = await service.call({});
        loading.value = false;
      } catch (er) {
        Config.errorHandler(title: "Error",message:er.toString() );
        loading.value = false;
      }
    }
  }
}
