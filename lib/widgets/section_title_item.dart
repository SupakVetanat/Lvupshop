import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lvup_shop/screen/home_item.dart';


class SectiontitleItem extends StatelessWidget {
  final String title;
  const SectiontitleItem({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.r),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                title,
                style: TextStyle(
                  color: Color(0xFF242F40),
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )),
        Padding(
          padding: EdgeInsets.only(left: 110.r),
          child: Container(
            child: TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomeItem()));
              },
              child: Text(
                'view all',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
