import 'package:flutter/material.dart';
import 'package:sunshine/screen/models/climatology.dart';
import 'dart:async';
import 'package:sunshine/screen/models/response.dart' as data;


class SummaryScreen extends StatefulWidget {
  @override
  _HistoryDataState createState() => _HistoryDataState();
}

class _HistoryDataState extends State<HistoryData> {

  Future<Map<String, dynamic>> _futureData;

  late List<Climatology> climatology;

  @override
  void initState() {
    super.initState();
    _futureData =
        data.fetchData('https://power.larc.nasa.gov/api/temporal/monthly/point?parameters=QV2M,WS10M,WS2M,TS,ALLSKY_SFC_SW_DWN,CLRSKY_SFC_SW_DWN,CLOUD_AMT,ALLSKY_SFC_UV_INDEX,ALLSKY_SFC_UVB,ALLSKY_SFC_UVA,ALLSKY_NKT,ALLSKY_SFC_SW_DIFF&community=RE&longitude=111.8305&latitude=2.2873&format=JSON&start=2019&end=2020');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future: _futureData,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            climatology = snapshot.data!['climatology'];
            return _buildMainScreen();
          }
          return _buildFetchingDataScreen();
        });
  }

