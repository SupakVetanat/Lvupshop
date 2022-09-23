import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lvup_shop/LocaleString.dart';
import 'package:lvup_shop/screen/Login.dart';
import 'package:lvup_shop/screen/splash/splash_page.dart';
import 'package:provider/provider.dart';

import 'google_login_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (context) => GoogleSignInController(),
                child: Login(),
              )
            ],
            child: GetMaterialApp(
              translations: LocaleString(),
              locale: Locale('en', 'US'),
              title: "My App",
              home: splashPage(),
              theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Kanit'),
            ),
          );
        });
  }
}
