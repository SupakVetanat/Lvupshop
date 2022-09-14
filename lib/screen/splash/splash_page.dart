import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lvup_shop/components/navbar.dart';

class splashPage extends StatefulWidget {
  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override
  void initState() {
    super.initState();
    _nevigatehome();
  }

  _nevigatehome() async {
    await Future.delayed(Duration(milliseconds: 2500), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => //
                  //WishListPage()
                  //ProfilePage()
                  //notificationPage()
                  //editProfilePage()
                  navBar()
              //
              ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Container(
            width: 0.5.sw,
            child: Image.asset("assets/images/logo.png"),
          ),
        ),
      ),
    );
    ;
  }
}
