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
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    chatGet.room != null
                        ? (chatGet.room?.name ?? "")
                        : (chatGet.user?.fullname ?? ""),
                    style: MyTextStyles.button.copyWith(color: Colors.black),
                  ),
                  if (chatGet.room != null)
                    Text(
                      "${chatGet.room!.members.length.toString()} members",
                      style: MyTextStyles.button.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          fontSize: 12),
                    ),
                ],
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
                physics: AlwaysScrollableScrollPhysics(),
                controller: chatGet.scrollController,
                itemCount: chatGet.messages.length,
                itemBuilder: (context, index) {
                  final message = chatGet.messages[index] as Message;
                   final isLastItem = index == chatGet.messages.length - 1;
                  final ismymessage = message.isMyMessage();
                  return chatGet.room != null
                      ? Padding(
                          padding:  EdgeInsets.only(bottom: isLastItem?60:15,top:index==0?15:0),
                          child: Column(
                            children: [
                              if (!ismymessage)
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 10, left: 10),
                                        child: CircleAvatar(
                                          radius: 18,
                                          backgroundColor: Colors.grey,
                                        ),
                                      ),
                                      Text(
                                        message.user.fullname,
                                        style: MyTextStyles.button
                                            .copyWith(color: Colors.black),
                                      ),
                                    ],
                                  ),
                                ),
                              chatBubble(ismymessage, message)
                            ],
                          ),
                        )
                      : chatBubble(ismymessage, message);
                },
              );
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  border: Border(
                      top:
                          BorderSide(width: 0.8, color: Colors.grey.shade200))),
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
                                : (chatGet.room != null)
                                    ? chatGet.sendMessageInRoom
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
  } //

  Widget chatBubble(bool ismymessage, var message) => ChatBubble(
        backGroundColor:
            message.isMyMessage() ? MyColors.primaryColor : Colors.grey,
        margin: ismymessage
            ? EdgeInsets.only(bottom: 10, right: 10)
            : EdgeInsets.only(
                bottom: 10,
                left: 10,
              ),
        padding: ismymessage
            ? EdgeInsets.only(left: 10, bottom: 10, right: 20, top: 10)
            : EdgeInsets.only(
                right: 10,
                top: 10,
                bottom: 10,
                left: 20,
              ),
        clipper: ChatBubbleClipper3(
            type: ismymessage
                ? BubbleType.sendBubble
                : BubbleType.receiverBubble),
        alignment: ismymessage ? Alignment.centerRight : Alignment.centerLeft,
        child: Text(
          message.message,
          style: MyTextStyles.chatStyle,
        ),
      );
}
