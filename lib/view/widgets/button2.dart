// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:resolute_ai_assignment/view/utils/colors.dart';
import 'package:sizer/sizer.dart';

class CommonButton extends StatelessWidget {
  String label;
  CommonButton({Key? key, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8.h,
      width: 90.w,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: themeColor, borderRadius: BorderRadius.circular(10)),
      child: Text(
        label,
        style:
            TextStyle(color: white, fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
