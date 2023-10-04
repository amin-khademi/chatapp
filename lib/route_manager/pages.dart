import 'package:chatapp/pages/login/login.dart';
import 'package:chatapp/pages/messages/messages.dart';
import 'package:chatapp/pages/register/register.dart';
import 'package:chatapp/pages/welcome/welcome.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:get/get.dart';

class Pages {
  static  List<GetPage<dynamic>> pages = [
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
    )
  ];
}
