import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:lvup_shop/screen/wish_list/wishListType.dart';

bool _delete = false;
List<wishListType> itemList = [
  wishListType(
      "1",
      "https://cdn1.epicgames.com/offer/611482b8586142cda48a0786eb8a127c/EGS_DeadbyDaylight_BehaviourInteractive_S1_2560x1440-a32581cf9948a9a2e24b2ff15c1577c7?h=270&resize=1&w=480",
      "test111111111"),
  wishListType(
      "2",
      "https://www.memuplay.com/blog/wp-content/uploads/2022/08/NYK3IVJBKCVC_IP4_1G.png",
      "test222222222"),
  wishListType(
      "3",
      "https://play-lh.googleusercontent.com/JkJhYyE_qikOcHmeEON1GrCLXwGlbU7pIw8VDQUHlRYnlW_fOLwAVwvn13vsqhFWnw=w526-h296-rw",
      "test333333333333")
];

class WishListPage extends StatefulWidget {
  const WishListPage({Key? key}) : super(key: key);

  @override
  State<WishListPage> createState() => _WishListState();
}

class _WishListState extends State<WishListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0XFFF9F9F9),
        ),
        child: Column(
          children: [
            Container(
                height: 0.20.sh,
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
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
                child: Container(
                  width: 0.7.sw,
                  height: 0.10.sh,
                  decoration: BoxDecoration(
                    color: Color(0xffeec643),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WISH LIST",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.white),
                          ),
                          Text(
                            itemList.length.toString(),
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.sp,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      Ink(
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
                              setState(() {
                                _delete = !_delete;
                              });
                            },
                            child: const Icon(Icons.delete),
                          )),
                    ],
                  ),
                )),
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                    itemBuilder: (context, index) => wishListItems(
                        items: itemList[index],
                        context: context,
                        onPressed: () {
                          setState(() {
                            itemList.removeAt(index);
                          });
                        },
                        index: index),
                    itemCount: itemList.length,
                    shrinkWrap: true),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

Widget wishListItems(
    {required wishListType items,
    required BuildContext context,
    required void Function()? onPressed,
    required int index}) {
  return AnimationConfiguration.staggeredList(
    position: index,
    duration: const Duration(milliseconds: 500),
    child: SlideAnimation(
      verticalOffset: 100.0,
      child: Center(
        child: Stack(children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.r, horizontal: 30.r),
            width: 0.8.sw,
            height: 150.h,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.r),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(80.r), // Image radius
                    child: Image.network(items.image, fit: BoxFit.cover),
                  ),
                ), //Pic
                SizedBox(
                  width: 0.05.sw,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 0.3.sw,
                      child: Flexible(
                        child: Text(
                          items.title,
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.sp),
                          maxLines: 1,
                          softWrap: false,
                          overflow: TextOverflow.clip,
                        ),
                      ),
                    ),
                    Container(
                      height: 80.h,
                      width: 0.3.sw,
                      padding: EdgeInsets.all(10.r),
                      decoration: BoxDecoration(
                        color: Color(0XFFF9F9F9),
                        borderRadius: BorderRadius.circular(15.r),
                      ),
                      child: Flexible(
                        child: Text(
                          items.description,
                          style: TextStyle(fontSize: 15.sp),
                          maxLines: 3,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          _delete
              ? Positioned(
                  // top: 20.h,
                  right: 0.77.sw,
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
                        onPressed: onPressed,
                        child: const Icon(Icons.remove),
                      )),
                )
              : SizedBox(),
        ]),
      ),
    ),
  );
}
