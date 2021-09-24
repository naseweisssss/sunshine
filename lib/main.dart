import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(
    MyApp(),
  );
}

// You need to configure your route on routes.dart
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: createRoute,
      initialRoute: mainhomepageRoute,
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme: Theme.of(context).textTheme.apply(displayColor: kTextColor),
        cupertinoOverrideTheme: CupertinoThemeData(
          primaryColor: Colors.red,
        ),
        textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.red),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
