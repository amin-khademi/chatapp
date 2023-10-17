import 'package:chatapp/constants/colors.dart';
import 'package:chatapp/constants/text_style.dart';
import 'package:chatapp/models/message.dart';
import 'package:chatapp/pages/chat/chat.get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
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
          StreamBuilder<bool>(
            stream: chatGet.onUpdateStream.stream,
            builder: (context, snapshot) {
              return ListView.builder(
                physics: ClampingScrollPhysics(),
                controller: chatGet.scrollController,
                itemCount: chatGet.messages.length,
                itemBuilder: (context, index) {
                  final message = chatGet.messages[index] as Message;
                  final ismymessage = message.isMyMessage();
                  return ChatBubble(
                    backGroundColor: message.isMyMessage()
                        ? MyColors.primaryColor
                        : Colors.grey,
                    margin: EdgeInsets.all(8),
                    clipper: ChatBubbleClipper3(
                        type: ismymessage
                            ? BubbleType.sendBubble
                            : BubbleType.receiverBubble),
                    alignment: ismymessage
                        ? Alignment.centerRight
                        : Alignment.centerLeft,
                    child: Text(
                      message.message,
                      style: MyTextStyles.button,
                    ),
                  );
                },
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border:
                      Border(top: BorderSide(width: 0.8, color: Colors.grey))),
              child: SafeArea(
                  child: Obx(
                () => TextField(
                  controller: chatGet.controller,
                  onChanged: (value) => chatGet.message.value = value,
                  minLines: 1,
                  maxLines: 5,
                  style: MyTextStyles.textfield
                      .copyWith(fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                          onPressed: chatGet.message.value.isEmpty
                              ? null
                              : chatGet.send,
                          icon: Icon(
                            Icons.send,
                            color: chatGet.message.value.isEmpty
                                ? Colors.grey
                                : MyColors.primaryColor,
                          )),
                      border: InputBorder.none,
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "write message"),
                ),
              )),
            ),
          )
        ],
      ),
    );
  }
}
