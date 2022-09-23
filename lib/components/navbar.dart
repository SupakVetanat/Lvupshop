import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lvup_shop/models/Profile_model.dart';
import 'package:lvup_shop/screen/Cart/Cart.dart';
import 'package:lvup_shop/screen/home.dart';
import 'package:lvup_shop/screen/home_cart.dart';
import 'package:lvup_shop/screen/notification/notification_page.dart';
import 'package:lvup_shop/screen/profile/profile_page.dart';
import 'package:lvup_shop/screen/setting_page.dart';
import 'package:lvup_shop/screen/wish_list/wish_list_page.dart';

int currentpage = 2;
Profile? userProfile;

class navBar extends StatefulWidget {
  Profile? user;
  navBar(
    this.user, {
    Key? key,
  }) : super(key: key);

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  @override
  void initState() {
    super.initState();
    userProfile = widget.user;
  }

  @override
  Widget build(BuildContext context) {
    var screen = [
      WishListPage(),
      HomeCart(), //shop
      Home(), //.ใส่ home
      CartPage(),
      ProfilePage(userProfile),
    ];
    print("navBar userProfile ${userProfile?.username}");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff46B1C9),
        leading: Ink(
            padding: EdgeInsets.symmetric(vertical: 5.r),
            decoration: ShapeDecoration(
              color: Color(0xff46B1C9),
              shape: CircleBorder(),
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color(0xffFCD9D6),
                onPrimary: Colors.red,
                shape: const CircleBorder(),
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => notificationPage()));
              },
              child: Icon(Icons.notifications, size: 25.r),
            )),
        actions: [
          Ink(
              padding: EdgeInsets.symmetric(vertical: 5.r),
              decoration: ShapeDecoration(
                color: Color(0xff46B1C9),
                shape: CircleBorder(),
              ),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color(0xffFCF4D9),
                  onPrimary: Color(0xffeec643),
                  shape: const CircleBorder(),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => settingPage()));
                },
                child: Icon(
                  Icons.settings,
                  size: 25.r,
                ),
              )),
        ],
      ),
      bottomNavigationBar: ConvexAppBar(
        items: [
          TabItem(
            icon: Icons.star_rounded,
          ),
          TabItem(
            icon: Icons.store,
          ),
          TabItem(
            icon: Icons.home,
          ),
          TabItem(
            icon: Icons.shopping_cart,
          ),
          TabItem(
            icon: Icons.person,
          ),
        ],
        initialActiveIndex: 2, //optional, default as 0
        disableDefaultTabController: false,
        onTap: (int i) => setState(() {
          currentpage = i;
        }),
        backgroundColor: Colors.white,
        color: Color(0xffD1D1D1),
        activeColor: Color(0xff46B1C9), style: TabStyle.reactCircle,
      ),
      body: screen[currentpage],
    );
  }
}
