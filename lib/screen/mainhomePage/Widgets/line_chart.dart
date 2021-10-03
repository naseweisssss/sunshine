import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:sunshine/screen/dashboard/history_data2.dart';
import 'package:sunshine/screen/dashboard/map_display.dart';
import 'package:sunshine/screen/dashboard/today.dart';
import 'package:sunshine/screen/mainhomePage/Widgets/line_titles.dart';
import 'package:flutter/material.dart';

import '../mainhomePage.dart';
import '../setting.dart';
import 'BottomNavItem.dart';

class LineChartWidget extends StatefulWidget {

  @override
  LineChartWidgetState createState() => LineChartWidgetState();
}

class LineChartWidgetState extends State<LineChartWidget> {

  final List<Color> gradientColors = [
    const Color(0xff23b6e6),
    const Color(0xff02d39a),
  ];

  String? data = "ALLSKY_SFC_UVA";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(
            color: CupertinoColors.black,
          ),
          title: const Text(
            'Analytic Chart',
            style: TextStyle(color: Colors.black),
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: Color(0xFFF5CEB8),
        ),

        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          height: 56,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BottomNavItem(
                title: "Today",
                svgScr: "icons/icons/homepage.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => mainhomePage()),
                  );
                },
                isActive: false,
              ),
              BottomNavItem(
                title: "Data",
                svgScr: "icons/icons/history.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HistoryData2()),
                  );
                },
                isActive: false,
              ),
              BottomNavItem(
                title: "Map",
                svgScr: "icons/icons/map.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapDisplay()),
                  );
                },
                isActive: false,
              ),
              BottomNavItem(
                title: "Analytic",
                svgScr: "icons/icons/calendar.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LineChartPage()),
                  );
                },
                isActive: true,
              ),
              BottomNavItem(
                title: "Settings",
                svgScr: "icons/icons/Settings.svg",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AccountScreen()),
                  );
                },
                isActive: false,
              ),
            ],
          ),
        ),
        body: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40.0,left: 50.0),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "All Sky Surface UVA Irradiance",
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ]),
            ),
          Padding(padding: const EdgeInsets.only(top: 65.0,right: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: 200,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                    child: Container(
                      height: 18,
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: data,
                          onChanged: (String? newValue) {
                            setState(() {
                              data = newValue!;
                            });
                          },
                          items: <String>[
                            "ALLSKY_SFC_UVA",
                            "ALLSKY_SFC_UVB",
                            "ALLSKY_SFC_SW_DWN",
                            "CLRSKY_SFC_SW_DWN"
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 120.0,left: 10.0, right: 10.0),
            child: Container(
              child: AspectRatio(aspectRatio: 1.4,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    color: Color(0xff232d37)),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 18.0, left: 12.0, top: 24, bottom: 12),
                    child:LineChart(
                      LineChartData(
                        minX: 0,
                        maxX: 5,
                        minY: 10,
                        maxY: 14,
                        titlesData: LineTitles.getTitleData(),
                        gridData: FlGridData(
                          show: true,
                          getDrawingHorizontalLine: (value) {
                            return FlLine(
                              color: const Color(0xff37434d),
                              strokeWidth: 1,
                            );
                          },
                          drawVerticalLine: true,
                      getDrawingVerticalLine: (value) {
                        return FlLine(
                          color: const Color(0xff37434d),
                          strokeWidth: 1,
                        );
                      },
                    ),
                    borderData: FlBorderData(
                      show: true,
                      border: Border.all(color: const Color(0xff37434d), width: 1),
                    ),
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 12.47),
                          FlSpot(1, 12.2),
                          FlSpot(2, 12.95),
                          FlSpot(3, 13.68),
                          FlSpot(4, 13.91),
                          FlSpot(5, 13.14),
                        ],
                        isCurved: true,
                        colors: gradientColors,
                        barWidth: 5,
                        // dotData: FlDotData(show: false),
                        belowBarData: BarAreaData(
                          show: true,
                          colors: gradientColors
                              .map((color) => color.withOpacity(0.3))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),),
              ),
        ),
            ),
          ),
      ],
    ),);
  }
}