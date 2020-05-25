import 'dart:convert';

import 'package:http/http.dart' as http;

class NetWorkHelper {
  final String url;

  NetWorkHelper({this.url});

  Future<dynamic> getData() async {
    http.Response response = await http.get(this.url);

    if (response.statusCode != 200) return null;

    return jsonDecode(response.body);
  }
}
