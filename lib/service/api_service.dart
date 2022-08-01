import 'package:http/http.dart' as http;
import 'package:sample_get_fetch/model/public_policy.dart';

class APIService {
  Future<http.Response> getPublicPolicy() async {
    final response = await http.get(Uri.parse(
        'https://bas-it.net/bas-it.net/LPDP/json/scholarship/public_policy.json'));
    try {
      return response;
    } catch (e) {
      return response;
    }
  }
}
