import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunshine/screen/dashboard/today.dart';
import 'package:sunshine/screen/mainhomePage/Widgets/BottomNavItem.dart';
import 'package:sunshine/screen/mainhomePage/mainhomePage.dart';
import 'package:sunshine/screen/mainhomePage/setting.dart';

import 'history_data2.dart';

class Calculator extends StatefulWidget {
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: CupertinoColors.black,
        ),
        title: const Text(
          'Output Calculator',
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
              title: "Analytic",
              svgScr: "icons/icons/calendar.svg",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LineChartPage()),
                );
              },
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
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 55.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100.0,
                    width: 300,
                    child: new Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10), // radius of 10
                          color: Colors
                              .deepOrange[100] // green as background color
                          ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Average irradiance in your area (W/m2)",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 25.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0, left: 50.0),
            child: Container(
              width: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                children: <Widget>[
                  IconButton(
                    splashColor: Colors.grey,
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15),
                          hintText: "Search for Solar Panel"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 275.0, left: 70.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 50.0,
                    width: 250,
                    child: new Container(
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(10), // radius of 10
                          color: Colors.red[100] // green as background color
                          ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Quantity:             ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 350.0, left: 70.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    child: new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // radius of 10
                      ),
                      child: Text(
                        "Congrats! You are able ",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: new Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10), // radius of 10
                      ),
                      child: Text(
                        "to save RM 88! ",
                        style: TextStyle(
                          fontSize: 25.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ]),
          ),
        ],
      ),
    );
  }
}
