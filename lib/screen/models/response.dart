import 'dart:convert';
import 'package:http/http.dart' as http;

import 'climatology.dart';

Future<Map<String, dynamic>> fetchData(String url) async {
  print('Fetching data from $url');

  http.Response response = await http.get(url);

  print('Fetching has completed with status code ${response.statusCode}');

  String stringJson = response.body;
  Map<String, dynamic> _json = json.decode(stringJson);
  Map<String, dynamic> data = Map();
  data['TS'] = (_json['TS'] as List)
      .map((item) => Parameter.fromJson(item))
      .toList();

  return data;
}