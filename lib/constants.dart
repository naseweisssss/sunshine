import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunshine/screen/authentication/home.dart';
import 'package:sunshine/screen/authentication/login.dart';
import 'package:sunshine/screen/authentication/signup.dart';
import 'package:sunshine/screen/dashboard/map_display.dart';
import 'package:sunshine/screen/mainhomePage/mainhomePage.dart';

import 'empty.dart';

const String homeRoute = "/authentication/home";
const String loginRoute = "/authentication/login";
const String signupRoute = "/authentication/signup";
const String mapDisplayRoute = "/dashboard/mapdisplay";
const String mainhomepageRoute = "mainhomePage/mainhomePage.dart";

const kBackgroundColor = Color(0xFFF8F8F8);
const kActiveIconColor = Color(0xFFE68342);
const kTextColor = Color(0xFF222B45);
const kBlueLightColor = Color(0xFFC7B8F5);
const kBlueColor = Color(0xFF817DC0);
const kShadowColor = Color(0xFFE6E6E6);

Route<dynamic> createRoute(settings) {
  switch (settings.name) {
    // Here is for you to define your route
    case homeRoute:
      return MaterialPageRoute(builder: (_) => HomePage());
    case loginRoute:
      return MaterialPageRoute(builder: (_) => LoginPage());
    case signupRoute:
      return MaterialPageRoute(builder: (_) => SignupPage());
    case mapDisplayRoute:
      return MaterialPageRoute(builder: (_) => MapDisplay());
    case mainhomepageRoute:
      return MaterialPageRoute(builder: (_) => mainhomePage());
    default:
      return MaterialPageRoute(
        builder: (context) => MainScreen(),
      );
  }
}
