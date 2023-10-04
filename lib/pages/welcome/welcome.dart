import 'package:chatapp/components/buttons/primary_button.dart';
import 'package:chatapp/components/buttons/underline_button.dart';
import 'package:chatapp/constants/text_style.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [_logo, _title],
          ),
          _buttons
        ],
      )),
    );
  }

  Widget get _title => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              "welcome to ",
              style: MyTextStyles.caption,
            ),
            Text(
              "Chatify App",
              style: MyTextStyles.header,
            )
          ],
        ),
      );

  Widget get _logo => Center(
        child: ClipRRect(borderRadius: BorderRadius.circular(20),child: Image.asset("assets/img/chatify_logo.png",width: 100,height: 100,)),
      );
  Widget get _buttons => Column(
        children: [
          PrimaryButton(
            title: "Sign in",
            onPressed: () {
              Get.toNamed(PageRoutes.singIn);
            },
          ),
          UnderlineButton(
            title: "create new acount? ",
            onPressed: () {
              Get.toNamed(PageRoutes.register);
            },
          )
        ],
      );
}
