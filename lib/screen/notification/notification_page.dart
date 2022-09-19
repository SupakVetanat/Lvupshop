import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'notificationType.dart';

List<notificationType> itemList = [
  notificationType(
      "xxx user comment 11111111111111",
      "https://cdn1.epicgames.com/offer/611482b8586142cda48a0786eb8a127c/EGS_DeadbyDaylight_BehaviourInteractive_S1_2560x1440-a32581cf9948a9a2e24b2ff15c1577c7?h=270&resize=1&w=480",
      "comment"),
  notificationType(
      "aaa user report your 22222222222222",
      "https://www.memuplay.com/blog/wp-content/uploads/2022/08/NYK3IVJBKCVC_IP4_1G.png",
      "report"),
  notificationType(
      "ccc user buy your 33333333333",
      "https://play-lh.googleusercontent.com/JkJhYyE_qikOcHmeEON1GrCLXwGlbU7pIw8VDQUHlRYnlW_fOLwAVwvn13vsqhFWnw=w526-h296-rw",
      "purchase")
];

class notificationPage extends StatefulWidget {
  const notificationPage({Key? key}) : super(key: key);

  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
  @override
  Widget build(BuildContext context) {
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
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_ios_rounded, size: 25.r),
            )),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: Color(0XFFF9F9F9),
              child: Stack(children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 20.r, horizontal: 35.r),
                  margin: EdgeInsets.only(bottom: 20.r),
                  width: 1.sw,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 1),
                      ),
                    ],
                  ),
                  child: Text(
                    "NOTIFICATION".tr,
                    style: TextStyle(
                        fontSize: 40.sp,
                        color: Color(0xff242f40),
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Positioned(
                  top: 65.w,
                  left: 35.r,
                  child: Container(
                    width: 80.w,
                    height: 30.h,
                    decoration: BoxDecoration(
                        color: Color(0xffeec643),
                        borderRadius: BorderRadius.circular(5.r)),
                    child: Center(
                      child: Text(
                        "NEW",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                )
              ]),
            ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) => notificatonItem(
                        index: index,
                        items: itemList[index],
                        context: context,
                      ),
                  itemCount: itemList.length,
                  shrinkWrap: true),
            ),
          ],
        ),
      ),
    );
  }
}

Widget notificatonItem(
    {required int index,
    required notificationType items,
    required BuildContext context}) {
  return Container(
    height: 0.15.sh,
    width: 1.sw,
    decoration: BoxDecoration(
      color: index.isOdd ? Colors.white : Color(0XFFF9F9F9),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.3),
          spreadRadius: 0,
          blurRadius: 7,
          offset: Offset(0.0, 9),
        ),
      ],
    ),
    child: Row(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.r),
          child: Stack(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CircleAvatar(
                  radius: 0.09.sw, // Image radius
                  backgroundImage: NetworkImage(
                    items.image,
                  )),
            ),
            Positioned(
              top: 50.w,
              left: 50.w,
              child: CircleAvatar(
                backgroundColor: items.type == "comment"
                    ? Color(0xffD0F5F6)
                    : items.type == "report"
                        ? Color(0xffFCD9D6)
                        : items.type == "purchase"
                            ? Color(0xffE9F6DC)
                            : Colors.white,
                radius: 15.r,
                child: Icon(
                  items.type == "comment"
                      ? Icons.chat_rounded
                      : items.type == "report"
                          ? Icons.warning_rounded
                          : items.type == "purchase"
                              ? Icons.shopping_cart
                              : null,
                  color: items.type == "comment"
                      ? Color(0xff46B1C9)
                      : items.type == "report"
                          ? Colors.red
                          : items.type == "purchase"
                              ? Colors.lightGreen
                              : Colors.white,
                  size: 18.r,
                ),
              ),
            )
          ]),
        ),
        Flexible(
          child: Text(
            items.text,
            style: TextStyle(fontSize: 15.sp),
            maxLines: 1,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}
