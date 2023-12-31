import 'package:chatapp/cacheManager/hive.cache.dart';
import 'package:chatapp/components/dialogs/addContact/addContact.dialog.dart';
import 'package:chatapp/components/dialogs/addRoom/addRoom.dialog.dart';
import 'package:chatapp/models/contact.dart';
import 'package:chatapp/models/room.dart';
import 'package:get/get.dart';
import 'package:rxdart/subjects.dart';

class MessagesGet extends GetxController {
  var isSearchEnabled = false.obs;
  var searchValue = ''.obs;

  PublishSubject<bool> contactsStream = PublishSubject<bool>();
  PublishSubject<bool> roomStream = PublishSubject<bool>();
  List<Contact> contacts = [
    // Contact(
    //     user: User(
    //         fullname: "ali", id: "65200e2beecd38ba4927bc4b", username: "ali"))
  ];
  List<Room> rooms = [];
  @override
  void onInit() {
    init();
    super.onInit();
  }

  void init() async {
    final list = await HiveCacheManager().getAll();
    contacts.clear();
    contacts.addAll(list);
    contactsStream.sink.add(true);

    final roomList = await HiveCacheManager().getAllRooms();
    rooms.clear();
    rooms.addAll(roomList);
    roomStream.sink.add(true);
  }

  void addContact() {
    Get.dialog(AddContactDialog(), barrierDismissible: true);
  }

  void addRoom() {
    Get.dialog(AddRoomDialog(), barrierDismissible: true);
  }
}
