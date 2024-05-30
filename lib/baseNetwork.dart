import 'dart:convert';
import 'package:http/http.dart' as http;

class BaseNetwork{
  static final String baseUrl = "https://valorant-api.com/v1/";

  static Future get(String partUrl) async {
    final url = baseUrl + partUrl;
    final response = await http.get(Uri.parse(url));
    final body = response.body;
    if(body.isNotEmpty){
      return json.decode(body);
    }
    return;
  }
}