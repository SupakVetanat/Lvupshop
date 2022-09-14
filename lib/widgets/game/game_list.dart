import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lvup_shop/models/models.dart';

class GameList extends StatelessWidget {
  final Product product;

  const GameList({Key? key, required this.product}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 0.4.sw,
          height: 0.415.sw,
          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
          child: TextButton(
            onPressed: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    image: NetworkImage(product.imageUrl),
                    fit: BoxFit.cover,
                  )),
              // child: Image.network(
              //   product.imageUrl,
              //   fit: BoxFit.cover,
              // ),
            ), //Image.network,
          ),
        ), //Container

        Positioned(
          top: 85.h,
          left: 3.w,
          child: Padding(
            padding: EdgeInsets.all(5.r),
            child: Container(
              //width: MediaQuery.of(context).size.width / 2 - 10,
              width: 130.w,
              height: 40.h,
              decoration: BoxDecoration(
                  color: Colors.black.withAlpha(60),
                  borderRadius: BorderRadius.circular(40.r)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Text(
                      product.name,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
      ],
    ); //stack
  }
}
