import 'dart:convert';


import 'package:chatapp/cacheManager/cacheManger.dart';
import 'package:chatapp/constants/config.dart';
import 'package:chatapp/services/base.dart';
import 'package:http/http.dart' as http;

class TokenFresherService extends BaseService {
  final Uri url = Uri.parse('${Config.httpsServicesBaseUrl}/token-fresher');
  Future<void> call(Map<String, dynamic> args) async {
    try {
      final client = http.Client();
    final response = await client.post(url,
        body: args, headers: {'Authorization': 'Bearer ${Config.me!.token}'});
    final decodedResponse = jsonDecode(response.body);
    if (response.statusCode == 200) {
      await UserCacheManager.save(token: decodedResponse['data']['token']);
      Config.me!.token = decodedResponse['data']['token'];
    } else {
      Config.errorHandler(
          title: decodedResponse['error_code'],
          message: decodedResponse['message']);
    }
    } catch (er){
      print(er);
    }
  }
}
