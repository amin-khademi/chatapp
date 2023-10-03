import 'package:chatapp/constants/config.dart';
import 'package:chatapp/route_manager/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: PageRoutes.welcome,
      title: 'ChatApp',
      theme: Config.primaryThemeData,
      getPages: Pages.pages,
    );
  }
}
