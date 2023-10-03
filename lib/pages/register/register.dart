import 'package:chatapp/components/buttons/primary_button.dart';
import 'package:chatapp/components/buttons/underline_button.dart';
import 'package:chatapp/components/loading.dart';
import 'package:chatapp/components/textfield/primary_textfield.dart';
import 'package:chatapp/pages/register/register.get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Register extends StatelessWidget {
  Register({super.key});

  final registerGet = RegisterGet();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            bottom: false,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 80, bottom: 70),
                  child: Center(
                    child: CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.black,
                      child: Center(
                          child: Icon(
                        CupertinoIcons.person_add,
                        color: Colors.white,
                        size: 80,
                      )),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: PrimaryTextfield(
                          maxLength: 30,
                          hint: "Enter Full Name",
                          onChanged: (newVal) {
                            registerGet.fullname.value = newVal;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: PrimaryTextfield(
                          hint: "Enter Username",
                          onChanged: (newVal) {
                            registerGet.username.value = newVal;
                          },
                          prefixIcon: CupertinoIcons.person,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                        child: PrimaryTextfield(
                          hint: "Enter Password",
                          onChanged: (newVal) {
                            registerGet.password.value = newVal;
                          },
                          isPassword: true,
                          prefixIcon: CupertinoIcons.lock,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 30),
                        child: Obx(() => registerGet.loading.value
                            ? MyLoading()
                            : PrimaryButton(
                                title: "create new acount",
                                onPressed: () {
                                  return registerGet.createNewAcount();
                                })),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: UnderlineButton(
                            title: "you already register?", onPressed: () {}),
                      )
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
