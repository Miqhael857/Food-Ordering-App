import 'package:flutter/material.dart';

class FeatureModel {
  final String foodSubtitle, foodTitle, foodassets;
  final String rating,price;

  FeatureModel({
    @required this.foodSubtitle,
    @required this.foodTitle,
    @required this.foodassets,
    @required this.rating,
    @required this.price,
  });
}