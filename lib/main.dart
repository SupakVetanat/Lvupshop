import 'package:flutter/material.dart';
import 'package:lvup_shop/screen/splash/splash_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "My App",
      home: splashPage(),
      theme: ThemeData(primarySwatch: Colors.blue),
    );
  }
}
