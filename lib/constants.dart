import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sunshine/screen/authentication/home.dart';
import 'package:sunshine/screen/authentication/login.dart';
import 'package:sunshine/screen/authentication/signup.dart';
import 'package:sunshine/screen/dashboard/map_display.dart';

import 'empty.dart';

const String homeRoute = "/authentication/home";
const String loginRoute = "/authentication/login";
const String signupRoute = "/authentication/signup";
const String mapDisplayRoute = "/dashboard/mapdisplay";

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
    default:
      return MaterialPageRoute(
        builder: (context) => EmptyScreen(),
      );
  }
}