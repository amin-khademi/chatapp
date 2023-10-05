
import 'package:chatapp/constants/text_style.dart';
import 'package:chatapp/models/me.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Config {
  Config._();
  static const httpsServicesBaseUrl = 'http://10.0.2.2:3000';
  static const socketServerBaseUrl = 'http://10.0.2.2:3000';
  static String showAvatarBaseUrl(String userId) =>
      '${Config.httpsServicesBaseUrl}/avatar/$userId';
  static String showRoomAvatarBaseUrl(String roomId) =>
      '${Config.httpsServicesBaseUrl}/room-avatar/$roomId';
  static ThemeData primaryThemeData = ThemeData(
      primarySwatch: Colors.green,
      fontFamily: 'Nexa',
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(8)),
          focusColor: Colors.black,
          iconColor: Colors.grey,
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black, width: 1),
              borderRadius: BorderRadius.circular(8)),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8))),
      appBarTheme: const AppBarTheme(
          toolbarHeight: 69,
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black, size: 24),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: MyTextStyles.appbar));

  static Me? me;

  static void errorHandler({String title = '', String message = ''}) {
    Get.snackbar(title, message,
        backgroundColor: Colors.grey.shade200,
        colorText: Colors.black,
        duration: const Duration(seconds: 4));
  }
}


