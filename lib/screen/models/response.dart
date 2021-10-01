import 'dart:convert';
import 'package:http/http.dart' as http;

import 'climatology2.dart';

Future<Parameter> fetchData(String url) async {
  print('Fetching data from $url');

  http.Response response = await http.get(url);

  print('Fetching has completed with status code ${response.statusCode}');

  if (response.statusCode == 200) {
    return Parameter.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load data');
  }

}