import 'package:chatapp/pages/RoomProperties/roomProperties.dart';
import 'package:chatapp/pages/chat/chat.dart';
import 'package:chatapp/pages/contactProperties/contactProperties.dart';
import 'package:chatapp/pages/login/view.dart';
import 'package:chatapp/pages/messages/messages.dart';
import 'package:chatapp/pages/register/register.dart';
import 'package:chatapp/pages/setting/view.dart';
import 'package:chatapp/pages/splash/splash.dart';
import 'package:chatapp/pages/welcome/welcome.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:get/get.dart';

class Pages {
  static List<GetPage<dynamic>> pages = [
    GetPage(
      name: PageRoutes.welcome,
      page: () => Welcome(),
    ),
    GetPage(
      name: PageRoutes.singIn,
      page: () => LogIn(),
    ),
    GetPage(
      name: PageRoutes.messages,
      page: () => Messages(),
    ),
    GetPage(
      name: PageRoutes.register,
      page: () => Register(),
    ),
    GetPage(
      name: PageRoutes.setting,
      page: () => Setting(),
    ),
    GetPage(name: PageRoutes.splash, page: () => Splash()),
    GetPage(name: PageRoutes.chat, page: () => Chat()),
    GetPage(name: PageRoutes.roomProperties, page: () => RoomProperties()),
    GetPage(
        name: PageRoutes.contactProperties, page: () => ContactProperties()),
  ];
}
