import 'package:chatapp/constants/config.dart';
import 'package:chatapp/constants/text_style.dart';
import 'package:chatapp/pages/setting/setting.get.dart';
import 'package:chatapp/pages/setting/setting_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  Setting({Key? key}) : super(key: key);

  final settingGet = SettingGet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 50, top: 15),
              child: Text(
                Config.me!.fullname.toString(),
                style: MyTextStyles.header,
              ),
            ),
            SettingItemWidget(
              title: "Privacy Policy",
            ),
            SettingItemWidget(
              title: "logOut",
              prefixIcon: Icons.exit_to_app_rounded,
              onTapped: settingGet.logOut,
              isInRed: true,
            )
          ],
        ),
      ),
    );
  }
}
