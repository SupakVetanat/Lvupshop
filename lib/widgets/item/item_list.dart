import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lvup_shop/models/models.dart';
import 'package:lvup_shop/screen/item_details.dart';

class ItemList extends StatelessWidget {
  final Item item;

  const ItemList({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 0.4.sw,
          height: 0.415.sw,
          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: TextButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ItemDetail(
                            item: item,
                          )));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: NetworkImage(item.imageUrl),
                    fit: BoxFit.cover,
                  )),
              // child: Image.network(
              //   product.imageUrl,
              //   fit: BoxFit.cover,
              // ),
            ), //Image.network,
          ),
        ),
        Positioned(
          top: 95.h,
          child: Padding(
            padding: EdgeInsets.all(5.r),
            child: Container(
              //width: MediaQuery.of(context).size.width / 2 - 10,
              width: 133.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Flexible(
                      child: Text(
                        item.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                        ),
                        maxLines: 2,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 95.h,
          left: 73.w,
          child: Padding(
            padding: EdgeInsets.all(5.r),
            child: Container(
              //width: MediaQuery.of(context).size.width / 2 - 10,
              width: 60.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: Color(0XFFF8FD14F),
                  borderRadius: BorderRadius.circular(10.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    child: Flexible(
                      child: Text(
                        "${item.price.toInt().toString()}฿",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                        maxLines: 2,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
