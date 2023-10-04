import 'package:chatapp/components/buttons/primary_button.dart';
import 'package:chatapp/components/buttons/underline_button.dart';
import 'package:chatapp/components/loading.dart';
import 'package:chatapp/components/textfield/primary_textfield.dart';
import 'package:chatapp/constants/text_style.dart';
import 'package:chatapp/pages/setting/setting.get.dart';
import 'package:flutter/cupertino.dart';
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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextButton(
                onPressed: settingGet.logOut,
                child: Text(
                  "logOut",
                  style: MyTextStyles.headline.copyWith(color: Colors.red),
                ))
          ],
        ),
      ),
    );
  }
}
