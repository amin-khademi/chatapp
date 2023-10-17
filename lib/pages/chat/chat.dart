import 'package:chatapp/constants/text_style.dart';
import 'package:chatapp/pages/chat/chat.get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Chat extends StatelessWidget {
  Chat({super.key});
  final chatGet = Get.put(ChatGet());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CupertinoButton(
          onPressed: chatGet.userInfo,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: CircleAvatar(
                  radius: 20,
                  backgroundColor: Colors.grey,
                ),
              ),
              Text(
                chatGet.user?.fullname ?? "",
                style: MyTextStyles.button.copyWith(color: Colors.black),
              ),
            ],
          ),
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          ListView(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(width: 0.8, color: Colors.grey))),
              child: SafeArea(
                  child: TextField(
                minLines: 1,
                maxLines: 5,
                style: MyTextStyles.textfield
                    .copyWith(fontWeight: FontWeight.bold),
                decoration: InputDecoration(
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText: "write message"),
              )),
            ),
          )
        ],
      ),
    );
  }
}
