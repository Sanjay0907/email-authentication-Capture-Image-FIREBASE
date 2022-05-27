import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resolute_ai_assignment/controller/auth/auth_controller.dart';
import 'package:resolute_ai_assignment/view/utils/colors.dart';
import 'package:sizer/sizer.dart';
import 'view/auth/signin.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController());
  });
  runApp(const LifeLongLerner());
}

class LifeLongLerner extends StatelessWidget {
  const LifeLongLerner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, __, _) {
      return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light().copyWith(
            appBarTheme: AppBarTheme(
              color: themeColor,
            ),
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: themeColor,
              unselectedItemColor: white,
            )),
        home: Login(),
      );
    });
  }
}
