import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lvup_shop/models/QandA_model.dart';

import 'QandAItems.dart';

List<QandAModel> itemList = [
  QandAModel(
      A: "A111111111111111111111111111111",
      Q: 'Q11111 11111111111 11111111111 111111 1111111'),
  QandAModel(
      A: "A222222222222222222222222222222",
      Q: 'Q222222222 222222222 22222222 2222222222 2222'),
  QandAModel(
      A: "A333333333333333333333333333333",
      Q: 'Q333333 3333333  3333333333 3333333333 3333333'),
];

class questionAndanswerPage extends StatefulWidget {
  const questionAndanswerPage({Key? key}) : super(key: key);

  @override
  State<questionAndanswerPage> createState() => _qAndaPageState();
}

class _qAndaPageState extends State<questionAndanswerPage> {
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
        child: Container(
          color: Color(0XFFF9F9F9),
          width: 1.sw,
          height: 1.sh,
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Q&A",
                      style: TextStyle(
                        color: Color(0xFF242F40),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  itemBuilder: (context, index) => QandAItem(
                        index: index,
                        Q: itemList[index].Q,
                        A: itemList[index].A,
                      ),
                  itemCount: itemList.length,
                  shrinkWrap: true),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.r),
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Still Need Help?",
                      style: TextStyle(
                        color: Color(0xFF242F40),
                        fontSize: 25,
                      ),
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                width: 1.sw,
                padding: EdgeInsets.symmetric(vertical: 20.r),
                decoration: BoxDecoration(
                    color: Color(0xffEBEBEB),
                    border: Border(bottom: BorderSide(color: Colors.black12))),
                child: Column(
                  children: [
                    Text(
                      "Contact Us",
                      style: TextStyle(
                        color: Color(0xFF242F40),
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                              child: const Icon(Icons.phone),
                            )),
                        SizedBox(
                          width: 0.1.sw,
                        ),
                        Ink(
                            padding: EdgeInsets.symmetric(vertical: 5.r),
                            decoration: ShapeDecoration(
                              color: Color(0xffeec643),
                              shape: CircleBorder(),
                            ),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Color(0xffFCF4D9),
                                onPrimary: Color(0xffeec643),
                                shape: const CircleBorder(),
                              ),
                              onPressed: () {},
                              child: Icon(
                                Icons.chat_rounded,
                                size: 25.r,
                              ),
                            )),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
