import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QandAItem extends StatefulWidget {
  final int index;
  final String Q;
  final String A;
  const QandAItem(
      {Key? key, required this.index, required this.Q, required this.A})
      : super(key: key);

  @override
  State<QandAItem> createState() => _QandAItemState();
}

class _QandAItemState extends State<QandAItem> {
  bool Sw = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        InkWell(
          onTap: () {
            setState(() {
              if (Sw) {
                Sw = false;
              } else {
                Sw = true;
              }
            });
          },
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 10.r),
            width: 1.sw,
            decoration: BoxDecoration(
                color: Color(0xffEBEBEB),
                border: Border(bottom: BorderSide(color: Colors.black12))),
            child: Center(
              child: Container(
                width: 0.8.sw,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        "Q${widget.index + 1}" + " : " + widget.Q,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                    Container(
                        child: Icon(
                      Sw ? Icons.arrow_drop_down : Icons.arrow_right,
                      size: 20.w,
                    )),
                  ],
                ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: Sw,
          child: Container(
            width: 1.sw,
            color: Colors.white,
            padding: EdgeInsets.all(16),
            child: Center(
              child: Container(
                width: 0.8.sw,
                child: Text(
                  "A${widget.index + 1} : " + widget.A,
                  style: TextStyle(
                    fontSize: 13.sp,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
