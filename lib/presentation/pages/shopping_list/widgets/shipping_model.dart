import 'package:flutter/material.dart';

class ShippingModel {
  final String title;
  final String? subTitle;
  final int count;
  final int price;
  final int weight;
  final int id;
  // final TextEditingController controller;
  bool isDeleted = false;

  ShippingModel(
      {required this.title,
      this.subTitle,
      required this.isDeleted,
      // this.controller,
      required this.count,
      required this.price,
      required this.weight,
      required this.id});
}
