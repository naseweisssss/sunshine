import 'package:flutter/material.dart';
import 'package:sunshine/screen/models/climatology.dart';
import 'dart:async';


class SummaryScreen extends StatefulWidget {
  @override
  _HistoryDataState createState() => _HistoryDataState();
}

class _HistoryDataState extends State<HistoryData> {

  Future<Map<String, dynamic>> _futureData;

  // Now the following variables only serve as helpers or convinient variables.
  // So that we don't need to change our previous code so much.
  // They will be updated in the FutureBuilder (once the fetch process completes)

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

  Scaffold _buildMainScreen() {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: <Widget>[
            const Text(
              'Peer and Self Assessement by',
              style: TextStyle(fontSize: 15),
            ),
            Text(
              evaluator.fullName,
              style: const TextStyle(fontSize: 25),
            ),
          ],
        ),
      ),
      body: ListView.separated(
        itemCount: assessments.length,
        itemBuilder: (context, index) => _ListTile(
          index: index,
          screen: this,
        ),
        separatorBuilder: (context, index) => Divider(
          color: Colors.grey,
        ),
      ),
    );
  }

  Scaffold _buildFetchingDataScreen() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircularProgressIndicator(),
            SizedBox(height: 50),
            Text('Fetching data in progress'),
          ],
        ),
      ),
    );
  }
} // class _SummaryScreenState

class _ListTile extends StatefulWidget {
  final int index;
  final _SummaryScreenState
  screen; // A convinience variable to access data from the screen object, so that no need to pass multiple variables

  _ListTile({this.index, this.screen});

  @override
  __ListTileState createState() => __ListTileState();
}

class __ListTileState extends State<_ListTile> {
  void _navigate() async {
    final result = await Navigator.pushNamed(context, detailsRoute, arguments: {
      'assessment': Assessment.copy(widget.screen.assessments[widget.index]),
      'criteria': widget.screen.criteria,
      'scales': widget.screen.scales
    });

    if (result != null) {
      setState(() => widget.screen.assessments[widget.index] = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(widget.screen.assessments[widget.index].member.shortName),
      subtitle: Text(widget.screen.assessments[widget.index].member.fullName),
      trailing: CircleAvatar(
        child: Text(
          widget.screen.assessments[widget.index].percent.round().toString(),
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: widget.screen.assessments[widget.index].percent < 50
            ? Colors.pink
            : Colors.purple,
      ),
      onTap: () => _navigate(),
    );
  }
}