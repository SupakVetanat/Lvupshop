import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lvup_shop/components/Rounded_TextFormField.dart';
import 'package:lvup_shop/models/Profile_model.dart';

class editProfilePage extends StatefulWidget {
  const editProfilePage({Key? key}) : super(key: key);

  @override
  State<editProfilePage> createState() => _editProfilePageState();
}

class _editProfilePageState extends State<editProfilePage> {
  String _radioValue = "male";

  void _handleRadioValueChange(String value) {
    setState(() {
      _radioValue = value;
      print(value);
    });
  }

  File? _image;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
  }

  final formkey = GlobalKey<FormState>();
  Profile profile = Profile(
      profileImage: '',
      email: ' ',
      password: ' ',
      username: ' ',
      repassword: ' ',
      birth: '',
      gender: 'male');
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
            child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: SingleChildScrollView(
            child: Container(
                width: 1.sw,
                height: 1.1.sh,
                decoration: BoxDecoration(
                  color: Color(0XFFF9F9F9),
                ),
                child: Form(
                  key: formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Stack(
                        children: [
                          CircleAvatar(
                              radius: 0.25.sw, // Image radius
                              backgroundImage: _image != null
                                  ? FileImage(File(_image!.path))
                                      as ImageProvider
                                  : AssetImage(
                                      'assets/images/user_img.jpg',
                                    )),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomRight,
                              child: Ink(
                                  decoration: ShapeDecoration(
                                    color: Colors.grey,
                                    shape: CircleBorder(),
                                  ),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.grey,
                                      padding: EdgeInsets.all(10.r),
                                      shape: const CircleBorder(),
                                    ),
                                    onPressed: getImage,
                                    child: Icon(
                                      Icons.image,
                                      size: 30.sp,
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                          width: 0.7.sw,
                          child: Text(
                            "Username".tr,
                            style: TextStyle(fontSize: 16.sp),
                            textAlign: TextAlign.left,
                          )),
                      RoundedTextFormField(
                        icon: Icons.person,
                        onSubmitted: (String? name) {
                          profile.username = name!;
                        },
                        // validator: Validators.required("กรุณากรอกข้อมูล"),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                          width: 0.7.sw,
                          child: Text(
                            "Email".tr,
                            style: TextStyle(fontSize: 16.sp),
                            textAlign: TextAlign.left,
                          )),
                      RoundedTextFormField(
                        icon: Icons.mail_rounded,
                        onSubmitted: (String? email) {
                          profile.email = email!;
                        },
                        // validator: Validators.required("กรุณากรอกข้อมูล"),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                          width: 0.7.sw,
                          child: Text(
                            "Gender".tr,
                            style: TextStyle(fontSize: 16.sp),
                            textAlign: TextAlign.left,
                          )),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                            value: "male",
                            groupValue: _radioValue,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xff46B1C9)),
                            onChanged: (context) {
                              _handleRadioValueChange("male");
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _radioValue = "male";
                              });
                            },
                            child: Text("Male".tr),
                          ),
                          SizedBox(
                            width: 20.w,
                          ),
                          Radio(
                            value: "female",
                            groupValue: _radioValue,
                            fillColor: MaterialStateColor.resolveWith(
                                (states) => Color(0xff46B1C9)),
                            onChanged: (context) {
                              _handleRadioValueChange("female");
                            },
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                _radioValue = "female";
                              });
                            },
                            child: Text("Female".tr),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                          width: 0.7.sw,
                          child: Text(
                            "Birthday".tr,
                            style: TextStyle(fontSize: 16.sp),
                            textAlign: TextAlign.left,
                          )),
                      // RoundedTextFormField(
                      //   icon: Icons.calendar_today_rounded,
                      //   onSubmitted: (String? email) {
                      //     profile.email = email!;
                      //   },
                      //   // validator: Validators.required("กรุณากรอกข้อมูล"),
                      // ),
                      Container(
                        width: 0.8.sw,
                        height: 35.h,
                        padding: EdgeInsets.symmetric(vertical: 5.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.sp),
                          color: Color(0X6646B1C9),
                        ),
                        child: FlatButton(
                            onPressed: () {
                              DatePicker.showDatePicker(context,
                                  theme: DatePickerTheme(
                                      backgroundColor: Colors.white,
                                      headerColor: Colors.white),
                                  showTitleActions: true,
                                  minTime: DateTime(1950, 3, 5),
                                  maxTime: DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day), onChanged: (date) {
                                print('change $date');
                              }, onConfirm: (date) {
                                setState(() {
                                  profile.birth =
                                      "${date.day}-${date.month}-${date.year}";
                                  print(profile.birth);
                                });
                              },
                                  currentTime: DateTime.now(),
                                  locale: LocaleType.th);
                            },
                            child: Row(
                              children: [
                                Icon(
                                  Icons.calendar_today_rounded,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 15.w,
                                ),
                                Text("${profile.birth}")
                              ],
                            )),
                      ),

                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                        width: 0.7.sw,
                        child: Text(
                          "Description".tr,
                          style: TextStyle(fontSize: 16.sp),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      RoundedTextFormField(
                        icon: Icons.edit,
                        onSubmitted: (String? email) {
                          profile.email = email!;
                        },
                        // validator: Validators.required("กรุณากรอกข้อมูล"),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: FlatButton(
                            color: Color(0xffeec643),
                            padding: EdgeInsets.all(15.r),
                            onPressed: () {
                              profile.gender = _radioValue;
                            },
                            child: Text(
                              "Edit profile".tr,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 17.sp),
                            )),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                )),
          ),
        )));
  }
}
