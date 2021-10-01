import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunshine/constants.dart';
import 'package:sunshine/data/data.dart';
import 'package:sunshine/screen/authentication/home.dart';
import 'package:sunshine/screen/mainhomePage/solar_card.dart';
import 'Widgets/category_card.dart';
import 'Widgets/BottomNavItem.dart';
import 'setting.dart';

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
              title: "Display",
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
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: Color(0xFFF5CEB8),
              image: DecorationImage(
                alignment: Alignment.centerLeft,
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
                      color: Color(0xFFF2BEA1),
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
                    maxHeight: 250,
                  ),
                  child: Expanded(
                    child: GridView.count(
                      crossAxisCount: 2,
                      childAspectRatio: .85,
                      children: <Widget>[
                        CategoryCard(
                          title: "Map Searching",
                          svgSrc: "icons/icons/map.svg",
                          press: () {},
                        ),
                        CategoryCard(
                          title: "Solar Calculator",
                          svgSrc: "icons/icons/calculator.svg",
                          press: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0, 0, 0),
                  child: Text(
                    "Solar Panel Recommendation",
                    style: Theme.of(context).textTheme.subtitle1!.copyWith(
                        fontWeight: FontWeight.w900,
                        fontSize: 20,
                        color: Colors.blueGrey.shade700),
                  ),
                ),
                ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: 250,
                    ),
                    child: Expanded(
                      child: GridView.count(
                          crossAxisCount: 1,
                          childAspectRatio: 2,
                          children: <Widget>[
                            CategoryCard(
                              title: "Map Searching",
                              svgSrc: "icons/icons/map.svg",
                              press: () {},
                            ),
                            CategoryCard(
                              title: "Map Searching",
                              svgSrc: "icons/icons/map.svg",
                              press: () {},
                            ),
                          ]),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSolarListView() {
    return ListView.builder(
        itemCount: solarData.length,
        itemBuilder: (context, index) {
          return SolarCard(solar: solarData[index]);
        });
  }
}
