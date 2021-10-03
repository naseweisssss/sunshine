import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sunshine/screen/models/climatology.dart';
// import 'package:sunshine/screen/models/response.dart';

class HistoryData extends StatefulWidget {
  @override
  _HistoryDataState createState() => _HistoryDataState();
}

class _HistoryDataState extends State<HistoryData> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        ),
      );
  }
}
