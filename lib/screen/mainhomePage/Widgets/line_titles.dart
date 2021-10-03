import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
    show: true,
    bottomTitles: SideTitles(
      showTitles: true,
      reservedSize: 35,
      getTextStyles: (context, value) => const TextStyle(
        color: Color(0xff68737d),
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
      getTitles: (value) {
        switch (value.toInt()) {
          case 1:
            return 'JAN';
          case 3:
            return 'MARCH';
          case 5:
            return 'MAY';
        }
        return '';
      },
      margin: 8,
    ),
    leftTitles: SideTitles(
      showTitles: true,
      getTextStyles: (context, value) => const TextStyle(
        color: Color(0xff67727d),
        fontWeight: FontWeight.bold,
        fontSize: 15,
      ),
      getTitles: (value) {
        switch (value.toInt()) {
          case 10:
            return '10';
          case 12:
            return '12';
          case 14:
            return '14';
        }
        return '';
      },
      reservedSize: 35,
      margin: 12,
    ),
  );
}