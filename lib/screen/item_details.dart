import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:lvup_shop/models/models.dart';

class ItemDetail extends StatelessWidget {
  final Item item;
  const ItemDetail({
    Key? key,
    required this.item,
  }) : super(key: key);

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

      //--------------------------------body----------------------------------------------
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: EdgeInsets.only(bottom: 5),
                      child: Container(
                        height: 350,
                        child: Image.network(item.imageUrl, fit: BoxFit.fill),
                      ),
                    ),
                  ), //ภาพ

                  Positioned(
                    child: Container(
                      width: 370.w,
                      height: 120.h,
                      decoration: BoxDecoration(
                        color: Colors.black.withAlpha(60),
                      ),
                    ),
                  ),

                  // TextButton(
                  //   style: TextButton.styleFrom(backgroundColor: Colors.red,
                  //   textStyle: TextStyle(fontSize: 20)),
                  // ),

                  Padding(
                    padding: EdgeInsets.only(left: 220.r, top: 15.r),
                    child: TextButton(
                        style: TextButton.styleFrom(
                            backgroundColor: Color(0xFF1A1A1A),
                            textStyle: TextStyle(fontSize: 20)),
                        onPressed: () {},
                        child: Text('ADD TO CART',
                            style: TextStyle(color: Colors.white))),
                  ),

                  Positioned(
                    child: Padding(
                      padding: EdgeInsets.only(left: 175.r, top: 10.r),
                      child: Container(
                          //width: MediaQuery.of(context).size.width / 2 - 10,
                          width: 50.w,
                          height: 50.h,
                          decoration: BoxDecoration(
                              color: Colors.lightGreen,
                              borderRadius: BorderRadius.circular(40.r)),
                          child: IconButton(
                            onPressed: () {},
                            iconSize: 40,
                            icon: Icon(Icons.shopping_cart),
                          ) //IconButton
                          ),
                    ),
                  )
                ],
              ), //ภาพสินค้า+กดลงตะกร้า-------------------------แยกwigdet
              Container(
                height: 190,
                child: Stack(
                  children: [
                    Positioned(
                      top: 13.h,
                      left: 5.w,
                      child: Padding(
                        padding: EdgeInsets.all(5.r),
                        child: Container(
                            //width: MediaQuery.of(context).size.width / 2 - 10,
                            width: 300.w,
                            height: 60.h,
                            decoration: BoxDecoration(
                                color: Color(0xffF8ECEDD),
                                borderRadius: BorderRadius.circular(10.r)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  child: Flexible(
                                    child: Text(
                                      item.name,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 50,
                                      ),
                                      maxLines: 2,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ), //กล่องชื่อไอเทม
                    Positioned(
                      child: Padding(
                        padding: EdgeInsets.only(right: 240.r, top: 10.r),
                        child: Container(
                            //width: MediaQuery.of(context).size.width / 2 - 10,
                            width: 80.w,
                            height: 80.h,
                            decoration: BoxDecoration(
                                color: Color(0xff46B1C9),
                                borderRadius: BorderRadius.circular(40.r)),
                            child: TextButton(
                              onPressed: () {},
                              child: CircleAvatar(
                                radius: 0.25.sw, // Image radius
                                backgroundImage: NetworkImage(
                                  'https://pbs.twimg.com/media/FYhq1n0XwAAqKil?format=jpg&name=medium',
                                ),
                              ),
                            )),
                      ),
                    ), //ภาพโปรไฟล์
                    Positioned(
                      top: 68.h,
                      left: 140.w,
                      child: Container(
                          //width: MediaQuery.of(context).size.width / 2 - 10,
                          //margin: EdgeInsets.only(bottom: 50.r),
                          width: 180.w,
                          height: 45.h,
                          decoration: BoxDecoration(
                              color: Color(0xffF8FD14F),
                              borderRadius: BorderRadius.circular(10.r)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Flexible(
                                  child: Text(
                                    "${item.price.toInt().toString()}฿",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 30,
                                    ),
                                    maxLines: 2,
                                    softWrap: false,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                            ],
                          )),
                    ), //กล่องใส่ราคา
                    Padding(
                      padding: EdgeInsets.only(top: 103.r, left: 7.r),
                      child: Container(
                        child: Text("USER A ",
                            style: TextStyle(
                              color: Color(0xFF242F40),
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    Positioned(
                      child: Padding(
                        padding: EdgeInsets.only(left: 83.r, top: 90.r),
                        child: Container(
                            width: 36.w,
                            height: 36.h,
                            decoration: BoxDecoration(
                                color: Color(0xffEEC643),
                                borderRadius: BorderRadius.circular(40.r)),
                            child: IconButton(
                              onPressed: () {},
                              iconSize: 23,
                              icon: Icon(Icons.sms),
                              color: Color(0xffFCF4D9),
                            ) //IconButton
                            ),
                      ),
                    ),
                  ],
                ),
              ), //ภาพโปร+ชื่อสินค้า+ราคา-------------------------แยกwigdet
              Container(
                //color: Color(0XFFF9F9F9),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)),
                    color: Color(0XFFF9F9F9)),
                height: 300,
                child: Stack(
                  children: [
                    Padding(
                        padding: EdgeInsets.all(18.r),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "DETAIL",
                            style: TextStyle(
                              color: Color(0xFF242F40),
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )), //หัวข้อดีเทล
                    Container(
                      padding: EdgeInsets.only(top: 50.r),
                      child: Padding(
                        padding: EdgeInsets.all(20.r),
                        child: Text(
                          "${item.detail}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          //maxLines: 100,
                        ),
                      ),
                    ) //รายละเอียด
                  ],
                ),
              ), //detail--------------------------แยกwigdet
            ], //Column
          ), //Column
        ),
      ),
    );
  }
}
