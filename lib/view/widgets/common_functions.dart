import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommonFunctions extends GetxController {
  // static CommonFunctions instance = Get.find();
  static text(
      String text, Color color, double fontSize, FontWeight fontWeight) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
