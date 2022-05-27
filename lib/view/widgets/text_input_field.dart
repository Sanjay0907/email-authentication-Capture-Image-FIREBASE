// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:resolute_ai_assignment/view/utils/colors.dart';
import 'package:sizer/sizer.dart';

class TextInputField extends StatelessWidget {
  String labelText;
  late TextEditingController controller;
  TextInputField({Key? key, required this.labelText, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: white,
      height: 9.h,
      width: 100.w,
      margin: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
      decoration: BoxDecoration(
          color: white,
          boxShadow: const [
            BoxShadow(
                color: Color.fromARGB(255, 194, 188, 188),
                offset: Offset(2, 3),
                blurRadius: 3),
          ],
          borderRadius: BorderRadius.circular(10)),
      padding: EdgeInsets.only(left: 5.w),
      alignment: Alignment.center,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            labelText: labelText,
            labelStyle: const TextStyle(
              fontSize: 20,
            )),
      ),
    );
  }
}
