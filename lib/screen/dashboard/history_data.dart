import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:sunshine/screen/models/climatology2.dart';
import 'package:sunshine/screen/models/response.dart';

class HistoryData extends StatefulWidget {
  @override
  _HistoryDataState createState() => _HistoryDataState();
}

class _HistoryDataState extends State<HistoryData> {

  late Future<Parameter> _futureParameter;

  @override
  void initState() {
    super.initState();
    _futureParameter = fetchData('https://power.larc.nasa.gov/api/temporal/monthly/point?parameters=QV2M,WS2M,TS,CLOUD_AMT&community=RE&longitude=111.8305&latitude=2.2873&format=JSON&start=2019&end=2020');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<Parameter>(
            future: _futureParameter,
            builder: (context,  AsyncSnapshot<Parameter> snapshot) {
              if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              if (snapshot.hasData) {

              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
