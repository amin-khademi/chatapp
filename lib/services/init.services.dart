import 'dart:convert';
import 'package:chatapp/cacheManager/hive.cache.dart';
import 'package:chatapp/constants/config.dart';
import 'package:chatapp/init.dart';
import 'package:chatapp/models/contact.dart';
import 'package:chatapp/models/message.dart';
import 'package:chatapp/models/room.dart';
import 'package:chatapp/models/user.dart';
import 'package:chatapp/services/base.dart';
import 'package:http/http.dart' as http;

class InitServices extends BaseService {
  final Uri url = Uri.parse('${Config.httpsServicesBaseUrl}/init');
  final Uri urlDrop =
      Uri.parse('${Config.httpsServicesBaseUrl}/clear-latest-offline-messages');

  String searchMemberDataInUsers(
      List<dynamic> json, String userId, bool fullName) {
    final foundItems =
        json.where((element) => element['_userId'] == userId).toList();
    if (foundItems.isNotEmpty) {
      if (fullName) {
        return foundItems.first['fullName'];
      } else {
        return foundItems.first['userName'];
      }
    } else {
      return '';
    }
  }

  Future<void> call(Map<String, dynamic> args) async {
    List<Map<String, dynamic>> latestDates = [];
    final rooms = await HiveCacheManager().getAllRooms();
    for (final room in rooms) {
      final newList = room.messages
          .where((element) => element.user.id != Config.me!.userId)
          .toList();
      final date = room.messages.isNotEmpty
          ? (newList.isNotEmpty ? newList.last.date.toString() : '')
          : null;
      latestDates.add({'roomId': room.id, 'dateTime': date});
    }

    var newArgs = args;
    newArgs['latestDates'] = jsonEncode(latestDates);

    final client = http.Client();
    final response = await client.post(url,
        body: newArgs,
        headers: {'Authorization': 'Bearer ${Config.me!.token}'});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      List<Room> rooms = [];
      for (final room in decodedResponse['data']['rooms']) {
        final roomObject = Room(
            creator: User.fromJson(room['creatorUser'][0]),
            id: room['_id'],
            name: room['name'],
            members: [
              for (final memberItem in room['members'])
                User(
                    fullname: searchMemberDataInUsers(
                        room['users'], memberItem['userId'], true),
                    id: memberItem['userId'],
                    username: searchMemberDataInUsers(
                        room['users'], memberItem['userId'], false),
                    role: memberItem['role'])
            ], 
            desc: room['desc'] ?? '',
            messages: room['messages'].length > 0
                ? ([
                    for (final messageItem in room['messages'])
                      Message(
                          message: messageItem['message'],
                          date: DateTime.parse(messageItem['dateTime']),
                          user: User.fromJson(messageItem['fromUser'][0]),
                          roomId: messageItem['roomId'])
                  ])
                : const []);
        rooms.add(roomObject);
        AppInit().socket?.emit('join-room', {'roomId': roomObject.id});
      }

      for (final room in rooms) {
        await HiveCacheManager().saveRoom(room);
      }

      // if(rooms.isNotEmpty){
      //   await _dropRooms(args['userId']);
      // }

      for (final messageObject in decodedResponse['data']
          ['latestOfflineMessages']) {
        final userJson = messageObject['user'][0];
        final user = User(
            fullname: userJson['fullName'],
            id: userJson['_id'],
            username: userJson['userName']);
        await HiveCacheManager().save(Contact(user: user, messages: [
          Message(
              date: DateTime.parse(messageObject['dateTime']),
              message: messageObject['message'],
              user: user)
        ]));
      }
      await _dropMessages(args['userId']);
    }
    try {} catch (er) {
      print(er);
    }
  }

  Future<void> _dropMessages(String userId) async {
    try {
      final client = http.Client();
      await client.post(urlDrop,
          body: {'userId': userId},
          headers: {'Authorization': 'Bearer ${Config.me!.token}'});
    } catch (er) {
      print(er);
    }
  }
}
