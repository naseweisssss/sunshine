import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sunshine/constants.dart';
import 'Widgets/category_card.dart';

class mainhomePage extends StatelessWidget {
  const mainhomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
        height: 80,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BottomNavItem(
              title: "Today",
              svgScr: "icons/icons/calendar.svg",
              press: () {},
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
              svgScr: "icons/icons/calendar.svg",
              press: () {},
              isActive: true,
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
          SafeArea(
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
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    childAspectRatio: .85,
                    children: <Widget>[
                      CategoryCard(
                        title: "Promotion of the day",
                        svgSrc: "icons/icons/Hamburger.svg",
                        press: () {},
                      ),
                      CategoryCard(
                        title: "Promotion of the day",
                        svgSrc: "icons/icons/Hamburger.svg",
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

class BottomNavItem extends StatelessWidget {
  final String svgScr;
  final String title;
  final VoidCallback press;
  final bool isActive;
  const BottomNavItem(
      {Key? key,
      required this.svgScr,
      required this.title,
      required this.press,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SvgPicture.asset(svgScr,
              color: isActive ? kActiveIconColor : kTextColor),
          Text(
            title,
            style: TextStyle(color: isActive ? kActiveIconColor : kTextColor),
          ),
        ],
      ),
    );
  }
}
