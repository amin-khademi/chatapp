import 'package:chatapp/components/buttons/primary_button.dart';
import 'package:chatapp/components/buttons/underline_button.dart';
import 'package:chatapp/components/loading.dart';
import 'package:chatapp/components/textfield/primary_textfield.dart';
import 'package:chatapp/pages/login/login_get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogIn extends StatelessWidget {
  LogIn({Key? key}) : super(key: key);

  final loginGet = LoginGet();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In'),
        leading: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100,),
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.black,
                  child: Icon(CupertinoIcons.lock_shield,
                      size: 80, color: Colors.white),
                ),
              ),
              
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  children: [
                    PrimaryTextfield(
                      hint: 'Enter Username',
                      prefixIcon: CupertinoIcons.person,
                      onChanged: (newVal) => loginGet.username.value = newVal,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15.0),
                      child: PrimaryTextfield(
                        hint: 'Enter Password',
                        isPassword: true,
                        prefixIcon: CupertinoIcons.lock,
                        onChanged: (newVal) => loginGet.password.value = newVal,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30.0),
                      child: Obx(() => loginGet.loading.value
                          ? const MyLoading()
                          : PrimaryButton(
                              title: 'Sign In',
                              onPressed: loginGet.loginToAcount)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: UnderlineButton(
                          title: 'Forgot password?', onPressed: () {}),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
