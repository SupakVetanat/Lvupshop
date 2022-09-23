import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lvup_shop/models/Profile_model.dart';
import 'package:lvup_shop/screen/addItem/addItem_Page.dart';
import 'package:lvup_shop/screen/edit_profile/edit_profile_page.dart';

Profile? userProfile;
String img64 = '';

class ProfilePage extends StatefulWidget {
  Profile? user;
  ProfilePage(this.user, {Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    super.initState();
    userProfile = widget.user;
    img64 = userProfile?.profileImage ?? img64;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff46B1C9),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => addItemPage()));
        },
        child: Icon(Icons.add),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Color(0XFFF9F9F9)),
          child: Column(
            children: [
              Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                      height: 170.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 3.r,
                            blurRadius: 7.r,
                            offset:
                                Offset(0, 3.r), // changes position of shadow
                          ),
                        ],
                      )),
                ),
                Positioned(
                  left: 0.8.sw,
                  child: Ink(
                      decoration: ShapeDecoration(
                        color: Colors.red,
                        shape: CircleBorder(),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xffFCD9D6),
                          onPrimary: Colors.red,
                          padding: EdgeInsets.zero,
                          shape: const CircleBorder(),
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => editProfilePage()));
                        },
                        child: const Icon(Icons.create_rounded),
                      )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: CircleAvatar(
                          radius: 0.2.sw, // Image radius
                          backgroundImage: img64 == ''
                              ? AssetImage('assets/images/user_img.jpg')
                              : MemoryImage(base64.decode(img64))
                                  as ImageProvider),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          height: 45.w,
                        ),
                        Text(
                          "${widget.user?.username}",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 27.sp),
                        ),
                        Text(
                          "${widget.user?.email}",
                          style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                        ),
                        SizedBox(
                          height: 10.w,
                        ),
                        Container(
                          width: 0.4.sw,
                          child: Flexible(
                              child: Text(
                            "${widget.user?.username}",
                            maxLines: 3,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          )),
                        ),
                      ],
                    ),
                  ],
                ),
                Positioned.fill(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Ink(
                            decoration: ShapeDecoration(
                              color: Color(0xff46B1C9),
                              shape: CircleBorder(),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffD0F5F6),
                                onPrimary: Color(0xff46B1C9),
                                padding: EdgeInsets.zero,
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {},
                              child: const Icon(Icons.chat_rounded),
                            )),
                        Ink(
                            decoration: ShapeDecoration(
                              color: Color(0xff46B1C9),
                              shape: CircleBorder(),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffE9F6DC),
                                onPrimary: Colors.lightGreen,
                                padding: EdgeInsets.zero,
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {},
                              child: const Icon(Icons.check_rounded),
                            )),
                        Icon(
                          Icons.star_rounded,
                          color: Color(0xffEEC643),
                          size: 30.h,
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Color(0xffEEC643),
                          size: 30.h,
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Color(0xffEEC643),
                          size: 30.h,
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Color(0xffEEC643),
                          size: 30.h,
                        ),
                        Icon(
                          Icons.star_rounded,
                          color: Color(0xffEEC643),
                          size: 30.h,
                        ),
                        SizedBox(
                          width: 20.w,
                        )
                      ],
                    ),
                  ),
                ),
              ]),
              Container(
                width: 1.sw,
                child: AnimationLimiter(
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) => profileItem(index: index),
                      itemCount: 6,
                      shrinkWrap: true),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget profileItem({required int index}) {
  return AnimationConfiguration.staggeredList(
    position: index,
    duration: const Duration(milliseconds: 500),
    child: SlideAnimation(
      verticalOffset: 50.0,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10.r),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.r),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30.r),
              child: SizedBox.fromSize(
                size: Size.fromRadius(0.25.sw), // Image radius
                child: Image.network(
                    'https://pbs.twimg.com/media/FbBa2CyXkAAr_19?format=jpg&name=360x360',
                    fit: BoxFit.cover),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.r, horizontal: 10.r),
                  width: 0.45.sw,
                  child: Flexible(
                    child: Text(
                      "100฿",
                      textAlign: TextAlign.right,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                      maxLines: 1,
                      softWrap: false,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10.r),
                  width: 0.45.sw,
                  child: Flexible(
                    child: Text(
                      "Title",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 20.sp),
                    ),
                  ),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.r, horizontal: 10.r),
                  width: 0.45.sw,
                  child: Flexible(
                      child: Text(
                    "descriptionnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn",
                    maxLines: 5,
                    softWrap: false,
                    overflow: TextOverflow.ellipsis,
                  )),
                ),
              ],
            )
          ],
        ),
      ),
    ),
  );
}
