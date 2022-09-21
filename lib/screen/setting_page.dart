import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';

import 'PurchasePage.dart';
import 'QandA_page.dart';

class settingPage extends StatefulWidget {
  const settingPage({Key? key}) : super(key: key);

  @override
  State<settingPage> createState() => _settingPageState();
}

class _settingPageState extends State<settingPage> {
  bool isSwitched = false;
  List<bool> _selectedLang = <bool>[true, false];
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
                      "Setting".tr,
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
              GestureDetector(
                onTap: () {
                  setState(() {
                    isSwitched = !isSwitched;
                    print(isSwitched);
                  });
                },
                child: Container(
                  width: 0.8.sw,
                  height: 0.1.sh,
                  decoration: BoxDecoration(
                      color: Color(0xffEBEBEB),
                      border: Border.all(color: Colors.black12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Dark Mode".tr),
                      Switch(
                        value: isSwitched,
                        onChanged: (value) {
                          setState(() {
                            isSwitched = value;
                            print(isSwitched);
                          });
                        },
                        activeTrackColor: Colors.lightBlueAccent[300],
                        activeColor: Color(0xff46B1C9),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedLang = <bool>[
                      !_selectedLang[0],
                      !_selectedLang[1]
                    ];
                  });
                },
                child: Container(
                  width: 0.8.sw,
                  height: 0.1.sh,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Language".tr),
                      ToggleButtons(
                        onPressed: (int index) {
                          setState(() {
                            var locale = Locale('en', 'EN');
                            if (Get.locale.toString() == 'th_TH') {
                              locale = Locale('en', 'EN');
                            } else {
                              locale = Locale('th', 'TH');
                            }
                            Get.updateLocale(locale);
                            for (int i = 0; i < _selectedLang.length; i++) {
                              _selectedLang[i] = i == index;
                            }
                          });
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        selectedBorderColor: Color(0xff46B1C9),
                        selectedColor: Colors.white,
                        fillColor: Color(0xff46B1C9),
                        color: Color(0xff46B1C9),
                        focusColor: Colors.white,
                        constraints: BoxConstraints(
                          minHeight: 30.h,
                          minWidth: 35.w,
                        ),
                        isSelected: _selectedLang,
                        children: [Text("EN"), Text("TH")],
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PurchasePage()));
                },
                child: Container(
                  width: 0.8.sw,
                  height: 0.1.sh,
                  decoration: BoxDecoration(
                      color: Color(0xffEBEBEB),
                      border: Border.all(color: Colors.black12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Purchase history".tr),
                      SizedBox(
                        width: 0.1.sw,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => questionAndanswerPage()));
                },
                child: Container(
                  width: 0.8.sw,
                  height: 0.1.sh,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.black12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Help".tr),
                      SizedBox(
                        width: 0.1.sw,
                      )
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  width: 0.8.sw,
                  height: 0.1.sh,
                  decoration: BoxDecoration(
                      color: Color(0xffEBEBEB),
                      border: Border.all(color: Colors.black12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text("Logout".tr),
                      SizedBox(
                        width: 0.1.sw,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        )));
  }
}
