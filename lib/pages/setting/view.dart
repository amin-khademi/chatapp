import 'package:cached_network_image/cached_network_image.dart';
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
                padding: const EdgeInsets.only(bottom: 30, top: 15),
                child: MaterialButton(
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60)),
                  onPressed: () {
                    settingGet.uploadAvatar();
                  },
                  child: Obx(() => (settingGet.profileAvatar.value != null &&
                          settingGet.profileAvatar.value != "")
                      ? CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 60,
                          backgroundImage:
                              FileImage(settingGet.profileAvatar.value!),
                        )
                      : CircleAvatar(
                          backgroundColor: Colors.grey.shade300,
                          radius: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(80),
                            child: CachedNetworkImage(
                              imageUrl:
                                  Config.showAvatarBaseUrl(Config.me!.userId),
                              errorWidget: (context, url, error) => Icon(
                                  Icons.person,
                                  color: Colors.grey.shade400,
                                  size: 50),
                            ),
                          ),
                        )),
                )),
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
