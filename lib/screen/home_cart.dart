import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lvup_shop/models/models.dart';
import 'package:lvup_shop/widgets/widgets.dart';


class HomeCart extends StatefulWidget {
  const HomeCart({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeCart> createState() => _HomeCartState();
}

class _HomeCartState extends State<HomeCart> {
  TextEditingController? _textEditingController = TextEditingController();
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
        child: SingleChildScrollView(
          child: Container(
            color: Color(0XFFF9F9F9),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20.r),
                  child: Center(
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10.r),
                          child: Center(
                            child: Container(
                              width: 250.w,
                              height: 40.h,
                              child: TextField(
                                controller: _textEditingController,
                                decoration: InputDecoration(
                                  labelText: 'Enter something',
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                        width: 3, color: Color(0xFFADADAD)),
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      width: 3,
                                      color: Color(0xFF46B1C9),
                                    ),
                                    borderRadius: BorderRadius.circular(15.r),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ), //Container
                        Positioned(
                          child: Padding(
                            padding: EdgeInsets.only(left: 240.r),
                            child: Container(
                              //width: MediaQuery.of(context).size.width / 2 - 10,
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                  color: Color(0xFFDAEFF4),
                                  borderRadius: BorderRadius.circular(40.r)),
                              child: IconButton(
                                onPressed: () {},
                                iconSize: 30,
                                icon: Icon(Icons.search),
                                color: Color(0xffFCF4D9),
                              ),
                            ),
                          ),
                        )
                      ],
                    ), //Stack
                  ),
                ), //search bar

                Container(
                  width: 1.sw,
                  height: 1.sh,
                  child: GridView.builder(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 7, vertical: 5),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.15,
                      ),
                      itemCount: Product.products.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Center(
                          child: GameList(
                            product: Product.products[index],
                          ),
                        );
                      }),
                ), //gridview

                // Container(
                //   width: 1.sw,
                //   height: 1.sh,
                //   child: GridView.count(
                //     primary: false,
                //     padding: const EdgeInsets.all(20),
                //     crossAxisSpacing: 15,
                //     mainAxisSpacing: 15,
                //     crossAxisCount: 2,
                //     children: <Widget>[
                //       GameList(
                //         product: Product.products[0],
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
