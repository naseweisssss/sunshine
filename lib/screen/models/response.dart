import 'dart:convert';
import 'package:http/http.dart' as http;

import 'climatology.dart';

Future<Map<String, dynamic>> fetchData(String url) async {
  print('Fetching data from $url');

  http.Response response = await http.get(url);

  print('Fetching has completed with status code ${response.statusCode}');

  String stringJson = response.body;
  Map<String, dynamic> _json = json.decode(stringJson);

  Map<String, dynamic> results = Map();

  results['climatology'] = (_json['climatology'] as List)
      .map((item) => Climatology.fromJson(item))
      .toList();

  return results;
}