import 'package:chatapp/constants/config.dart';
import 'package:chatapp/models/contact.dart';
import 'package:chatapp/models/message.dart';
import 'package:chatapp/models/room.dart';
import 'package:chatapp/models/user.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:chatapp/route_manager/pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  //get storage
  await GetStorage.init();

  //hive
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(MessageAdapter());
  Hive.registerAdapter(ContactAdapter());
  Hive.registerAdapter(RoomAdapter());
  //run app
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: PageRoutes.splash,
        title: 'ChatApp',
        theme: Config.primaryThemeData,
        getPages: Pages.pages,
      ),
    );
  }
}
