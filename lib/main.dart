import 'package:chatapp/constants/config.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:chatapp/route_manager/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PageRoutes.splash,
      title: 'ChatApp',
      theme: Config.primaryThemeData,
      getPages: Pages.pages,
    );
  }
}
