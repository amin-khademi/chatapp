import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatapp/constants/colors.dart';
import 'package:chatapp/constants/config.dart';
import 'package:chatapp/constants/text_style.dart';
import 'package:chatapp/models/contact.dart';
import 'package:chatapp/route_manager/page_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageWidget extends StatelessWidget {
  final Contact contact;
  const MessageWidget({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final int badgeCount = contact.messages
        .where((element) => element.seen == false)
        .toList()
        .length;

    return Stack(
      alignment: Alignment.center,
      children: [
        InkWell(
          onTap: () => Get.toNamed(PageRoutes.chat, arguments: contact.user),
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(width: .5, color: Colors.grey.shade300)),
            ),
            padding: const EdgeInsets.all(24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundColor: Colors.grey.shade300,
                    child: CachedNetworkImage(
                      imageUrl: Config.showAvatarBaseUrl(contact.user.id),
                      errorWidget: (context, url, error) => Icon(Icons.person,
                          color: Colors.grey.shade400, size: 50),
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 10),
                            child: Text(contact.user.fullname,
                                style: MyTextStyles.title),
                          ),
                          Text(
                              contact.messages.isNotEmpty
                                  ? _beautifyDate(contact.messages.last.date)
                                  : '',
                              style: MyTextStyles.small)
                        ],
                      ),
                      SizedBox(
                        height: 16,
                        child: Text(
                            contact.messages.isNotEmpty
                                ? contact.messages.last.message
                                : '',
                            style: MyTextStyles.headline
                                .copyWith(overflow: TextOverflow.ellipsis)),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        if (badgeCount > 0)
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 30,right: 45),
              child: CircleAvatar(
                radius: 14,
                backgroundColor: MyColors.primaryColor,
                child: Text(badgeCount>10?"+10": badgeCount.toString(),
                    style: MyTextStyles.small.copyWith(fontSize: 14,
                        color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
      ],
    );
  }

  String _beautifyDate(DateTime date) {
    return "${date.month}/${date.day} ${date.hour}:${date.minute}";
  }
}
