import 'package:chatapp/constants/colors.dart';
import 'package:chatapp/pages/messages/view.get.dart';
import 'package:chatapp/pages/messages/view.chats.dart';
import 'package:chatapp/pages/messages/view.rooms.dart';
import 'package:chatapp/pages/messages/view.tabbar.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Messages extends StatefulWidget {
  const Messages({Key? key}) : super(key: key);

  @override
  State<Messages> createState() => _MessagesState();
}

class _MessagesState extends State<Messages> with TickerProviderStateMixin {
  TabController? _controller;
  final messagesGet = Get.put(MessagesGet());

  @override
  void initState() {
    _controller = TabController(vsync: this, length: 2, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MESSAGES'),
        leading: IconButton(
            onPressed: () => Get.toNamed(PageRoutes.setting),
            icon: const Icon(CupertinoIcons.line_horizontal_3_decrease)),
        actions: [
          IconButton(
              onPressed: () {
                messagesGet.isSearchEnabled.value =
                    !messagesGet.isSearchEnabled.value;
              },
              icon: Obx(() => messagesGet.isSearchEnabled.value
                  ? const Icon(Icons.close)
                  : const Icon(CupertinoIcons.search))),
        ],
      ),
      body: Stack(
        children: [
          TabBarView(controller: _controller, children: [
            MessagesChatsTab(),
            MessagesRoomsTab(),
          ]),
          MessagesTabbar(controller: _controller!),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(right: 20,bottom: 20),
              child: Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  backgroundColor: MyColors.primaryColor,
                  onPressed: () => _controller?.index == 0
                      ? messagesGet.addContact()
                      : messagesGet.addRoom(),
                  child: const Icon(Icons.add),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
