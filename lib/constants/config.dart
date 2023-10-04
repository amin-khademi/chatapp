import 'package:chatapp/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Config {
  Config._();
  static const httpServicesBaseUrl = "http://10.0.2.2:3000";
  static ThemeData primaryThemeData = ThemeData(
      primarySwatch: Colors.green,
      fontFamily: "Nexa",
      scaffoldBackgroundColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1),
            borderRadius: BorderRadius.circular(8)),
        focusColor: Colors.black,
        iconColor: Colors.grey,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
      appBarTheme: AppBarTheme(
          toolbarHeight: 70,
          color: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          elevation: 0,
          centerTitle: true,
          titleTextStyle: MyTextStyles.appbar));
  static void errorHandler({String title = "", String message = ""}) {
    Get.snackbar(title, message, backgroundColor: Colors.grey.shade200,duration: Duration(seconds: 4));
  }
}


