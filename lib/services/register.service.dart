

import 'package:chatapp/constants/config.dart';
import 'package:chatapp/services/base.dart';
import 'package:http/http.dart' as http;

class RegisterService extends BaseService {
  final Uri url = Uri.parse("${Config.httpServicesBaseUrl}/register");

  @override
  Future<bool> call(Map<String, dynamic> args) async {
    final client = http.Client();
    final response = await client.post(url, body: args);

    print(response);
    print(response.statusCode);
    print(response.runtimeType);
    return false;
  }
}
