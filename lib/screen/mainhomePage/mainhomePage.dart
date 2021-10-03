import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunshine/data/data.dart';
import 'package:sunshine/screen/dashboard/calculator.dart';
import 'package:sunshine/screen/dashboard/history_data2.dart';
import 'package:sunshine/screen/dashboard/map_display.dart';
import 'package:sunshine/screen/dashboard/today.dart';
import 'package:sunshine/screen/mainhomePage/solar_card.dart';
import 'Widgets/category_card.dart';
import 'Widgets/BottomNavItem.dart';
import 'setting.dart';
import 'Widgets/product_card.dart';

class mainhomePage extends StatelessWidget {
  const mainhomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
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
        children: <Widget>[
          Container(
            height: size.height * 1,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  0.4,
                  0.6,
                  0.9,
                ],
                colors: [
                  Colors.yellow.shade200,
                  Colors.yellow.shade300,
                  Colors.orange.shade300,
                  Colors.redAccent.shade200,
                ],
              ),
              image: DecorationImage(
                alignment: Alignment.topLeft,
                image: AssetImage("images/undraw_pilates_gpdb.png"),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    alignment: Alignment.center,
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: Color(0xFFEC8271),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset("icons/icons/menu.svg"),
                  ),
                ),
                Text(
                  "\t\tMake Cents out of \n\t\tSolar",
                  style: Theme.of(context).textTheme.subtitle1!.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 38,
                      color: Colors.blueGrey[900]),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: "Search",
                        icon: SvgPicture.asset("icons/icons/search.svg"),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 260,
                  ),
                  child: Container(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      children: <Widget>[
                        CategoryCard(
                          title: "Map Searching",
                          svgSrc: "icons/icons/map.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MapDisplay()),
                            );
                          },
                        ),
                        CategoryCard(
                          title: "Solar Calculator",
                          svgSrc: "icons/icons/calculator.svg",
                          press: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Calculator()),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  child: Divider(
                    color: Colors.black,
                    indent: 20,
                    endIndent: 20,
                  ),
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(22.0, 0, 22.0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          "Solar Panel Recommendation",
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1!
                              .copyWith(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Colors.black),
                        ),
                      ),
                      Text(
                        "See more",
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                              color: Colors.blue.shade500,
                              decoration: TextDecoration.underline,
                            ),
                      ),
                    ],
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: 400,
                  ),
                  child: Column(
                    children: <Widget>[
                      ProductCard(
                        image: 'images/Solarpanel1.png',
                        title:
                            'Fenteer 300 Watt 2 in 1\nSolar Panel Starter\n\nRM320',
                        press: () {},
                      ),
                      ProductCard(
                        image: 'images/solarpanel2.png',
                        title:
                            'Fenteer 300 Watt 2 in 1\nSolar Panel Starter\n\nRM450',
                        press: () {},
                      ),
                      ProductCard(
                        image: 'images/solarpanel3.png',
                        title:
                            'Fenteer 300 Watt 2 in 1\nSolar Panel Starter\n\nRM360',
                        press: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
