import 'package:chatapp/pages/splash/splash.get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends StatelessWidget {
  Splash({super.key});

  final splashGet = Get.put(SplashGet());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [Center(child: Expanded(child: Image.asset("assets/img/icons8-chat-48.png",width: 200,)))],
      ),
    );
  }
}
