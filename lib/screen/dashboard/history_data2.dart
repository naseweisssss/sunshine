import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunshine/screen/mainhomePage/Widgets/BottomNavItem.dart';
import 'package:sunshine/screen/mainhomePage/mainhomePage.dart';

import 'dart:ui' as ui;

import 'package:sunshine/screen/mainhomePage/setting.dart';

import 'map_display.dart';

class HistoryData2 extends StatefulWidget {
  @override
  _HistoryData2State createState() => _HistoryData2State();
}

class _HistoryData2State extends State<HistoryData2> {
  final double _borderRadius = 24;

  var items = [
    PlaceInfo('January', Color(0xff6DC8F3), Color(0xff73A1F9), 4.4, '85.52',
        '25.99', '19.47', '0.07'),
    PlaceInfo('February', Color(0xffFFB157), Color(0xffFFA057), 3.7, '89.79',
        '25.92', '18.86', '0.07'),
    PlaceInfo('March', Color(0xffFF5B95), Color(0xffF8556D), 4.5, '84.06',
        '26.19', '19.47', '0.09'),
    PlaceInfo('April', Color(0xffD76EF5), Color(0xff8F7AFE), 4.1, '80.34',
        '26.52', '20.14', '0.12'),
    PlaceInfo('May', Color(0xff42E695), Color(0xff3BB2B8), 4.2, '87.77',
        '26.87', '20.81', '0.12'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: CupertinoColors.black,
        ),
        title: const Text(
          'History Data',
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
              title: "Home",
              svgScr: "icons/icons/homepage.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => mainhomePage()),
                );
              },
              isActive: true,
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
              title: "Today",
              svgScr: "icons/icons/calendar.svg",
              press: () {},
              isActive: false,
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
      body: Container(
        child: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return Center(
                  child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: <Widget>[
                    Container(
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(_borderRadius),
                            gradient: LinearGradient(
                                colors: [
                                  items[index].startColor,
                                  items[index].endColor
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight),
                            boxShadow: [
                              BoxShadow(
                                color: items[index].endColor,
                                blurRadius: 12,
                                offset: Offset(0, 6),
                              )
                            ])),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      top: 0,
                      child: CustomPaint(
                        size: Size(100, 150),
                        painter: CustomCardShapePainter(
                            _borderRadius, Colors.pink, Colors.red),
                      ),
                    ),
                    Positioned.fill(
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            flex: 4,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Row(children: <Widget>[
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    items[index].name,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 27,
                                        fontFamily: 'Avenir',
                                        fontWeight: FontWeight.w700),
                                  ),
                                ]),
                                SizedBox(height: 12),
                                Row(children: <Widget>[
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Temperature                       ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Avenir',
                                    ),
                                  ),
                                  Text(
                                    items[index].temp + 'C',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Avenir',
                                    ),
                                  ),
                                ]),
                                SizedBox(height: 4),
                                Row(children: <Widget>[
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Specific Humidity (2m)     ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Avenir',
                                    ),
                                  ),
                                  Text(
                                    items[index].humidity + 'g/kg',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Avenir',
                                    ),
                                  ),
                                ]),
                                SizedBox(height: 4),
                                Row(children: <Widget>[
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Wind Speed（2m)             ',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Avenir',
                                    ),
                                  ),
                                  Text(
                                    items[index].wind + 'm/s',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontFamily: 'Avenir',
                                    ),
                                  ),
                                ]),
                                SizedBox(height: 4),
                                Row(
                                  children: <Widget>[
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      'Cloud Amount                    ',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontFamily: 'Avenir',
                                      ),
                                    ),
                                    Flexible(
                                      child: Text(
                                        items[index].cloud + '%',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                          fontFamily: 'Avenir',
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ));
            }),
      ),
    );
  }
}

class PlaceInfo {
  final String name;
  final String temp;
  final String wind;
  final String humidity;
  final String cloud;
  final double rating;
  final Color startColor;
  final Color endColor;

  PlaceInfo(this.name, this.startColor, this.endColor, this.rating, this.cloud,
      this.temp, this.humidity, this.wind);
}

class CustomCardShapePainter extends CustomPainter {
  late double radius;
  late Color startColor;
  late Color endColor;

  CustomCardShapePainter(this.radius, this.startColor, this.endColor);

  @override
  void paint(Canvas canvas, Size size) {
    var radius = 24.0;

    var paint = Paint();
    paint.shader = ui.Gradient.linear(
        Offset(0, 0), Offset(size.width, size.height), [
      HSLColor.fromColor(startColor).withLightness(0.8).toColor(),
      endColor
    ]);

    var path = Path()
      ..moveTo(0, size.height)
      ..lineTo(size.width - radius, size.height)
      ..quadraticBezierTo(
          size.width, size.height, size.width, size.height - radius)
      ..lineTo(size.width, radius)
      ..quadraticBezierTo(size.width, 0, size.width - radius, 0)
      ..lineTo(size.width - 1.5 * radius, 0)
      ..quadraticBezierTo(-radius, 2 * radius, 0, size.height)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
