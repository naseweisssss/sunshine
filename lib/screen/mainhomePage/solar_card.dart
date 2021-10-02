import 'package:flutter/material.dart';
import 'package:sunshine/data/data.dart';

class SolarCard extends StatelessWidget {
  final SolarDataModel solar;

  const SolarCard({Key? key, required this.solar}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: solar.backgroundColor),
      height: 180,
      width: double.infinity,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 140,
                    child: Image.asset(solar.image),
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
