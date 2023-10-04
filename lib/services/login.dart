import 'dart:convert';

import 'package:chatapp/cacheManager/cacheManger.dart';
import 'package:chatapp/constants/config.dart';
import 'package:chatapp/services/base.dart';
import 'package:http/http.dart' as http;

class LoginService extends BaseService {
  final Uri url = Uri.parse("${Config.httpServicesBaseUrl}/signin");

  @override
  Future<bool> call(Map<String, dynamic> args) async {
    final client = http.Client();
    final response = await client.post(url, body: args);
    final decodedResponse = jsonDecode(response.body);
    print(decodedResponse);
    print(decodedResponse.runtimeType);
    if (response.statusCode == 200) {
      Config.errorHandler(
          title: decodedResponse["error_code"],
          message: decodedResponse["message"]);

      await UserCacheManager.save(
          fullname: decodedResponse['fullName'],
          userId: decodedResponse['data']['_id'],
          username: decodedResponse['userName'],
          token: decodedResponse['data']['token']);
      Future.delayed(Duration(seconds: 1)).then((value) => null);

      return true;
    } else {
      Config.errorHandler(
          title: decodedResponse["error_code"],
          message: decodedResponse["message"]);
      return false;
    }
  }
}
