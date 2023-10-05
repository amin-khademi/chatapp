import 'package:chatapp/models/user.dart';

class Me {
  String userId;
  String fullname;
  String username;
  String token;

  Me(
      {required this.userId,
      required this.fullname,
      required this.username,
      required this.token});
  User exportToUser() {
    return User(id: userId, fullname: fullname, username: username);
  }
}
