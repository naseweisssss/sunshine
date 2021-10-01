import 'package:flutter/material.dart';

class SolarDataModel {
  int id;
  String name;
  String description;
  String price;
  String image;
  Color backgroundColor;

  SolarDataModel(
      {required this.id,
      required this.backgroundColor,
      required this.description,
      required this.price,
      required this.image,
      required this.name});
}

List<SolarDataModel> solarData = [
  SolarDataModel(
      id: 1,
      backgroundColor: Color(0xffffeae9),
      description: "300 Watt 2 in 1 \nSolar Panel Starter",
      price: "RM320",
      image: "images/Solarpanel1.png",
      name: "Fenteer"),
  SolarDataModel(
      id: 2,
      backgroundColor: Color(0xffe9eff2),
      description:
          "Solar Panel 100w 18V 12V, Light weight Solar Panel, Mono crystalline",
      price: "RM320",
      image: "images/Solarpanel2.png",
      name: "Fenteer"),
  SolarDataModel(
      id: 3,
      backgroundColor: Color(0xffffeae9),
      description: "ECO-WORTHY 3900W, Watt 20-195W Solar Panel",
      price: "RM320",
      image: "images/Solarpanel3.png",
      name: "Fenteer"),
];
