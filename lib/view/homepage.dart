// ignore_for_file: avoid_print

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:resolute_ai_assignment/view/utils/colors.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? image;
  Future pickImage() async {
    try {} on PlatformException catch (e) {
      print(e.toString());
    }

    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;

    final imageTemp = File(image.path);
    setState(() => this.image = imageTemp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.symmetric(
          horizontal: 5.w,
          vertical: 1.h,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: 70.h,
              width: 95.w,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: black,
                  width: 5,
                ),
              ),
              child: image != null
                  ? Image.file(
                      image!,
                      fit: BoxFit.fill,
                    )
                  : const Center(
                      child: Text(
                        'Scan',
                        style: TextStyle(
                          fontSize: 60,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
            ),
            InkWell(
              onTap: () {
                pickImage();
              },
              child: Container(
                height: 10.h,
                width: 80.w,
                decoration: BoxDecoration(
                  color: themeColor,
                  borderRadius: BorderRadius.circular(
                    40,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black,
                      offset: Offset(
                        2,
                        5,
                      ),
                      blurRadius: 5,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Text(
                  'Scan',
                  style: TextStyle(
                    color: white,
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
