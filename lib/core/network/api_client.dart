import 'package:cleva_test/core/error/api_exception.dart';
import 'package:http/http.dart' as http;

class ApiClient {
  final http.Client client;

  ApiClient({required this.client});

  Future<dynamic> get(String url) async {
    try {
      final response = await client.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw ApiException('Unable to fetch data');
      }
    } catch (e) {
      throw ApiException(e.toString());
    }
  }
}
