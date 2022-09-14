import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lvup_shop/components/Rounded_TextFormField.dart';

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

  final formkey = GlobalKey<FormState>();
  Profile profile =
      Profile(email: ' ', password: ' ', name: ' ', repassword: ' ', birth: '');
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
                              backgroundImage: NetworkImage(
                                'https://pbs.twimg.com/media/FYhq1n0XwAAqKil?format=jpg&name=medium',
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
                                    onPressed: () {},
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
                            "Username",
                            style: TextStyle(fontSize: 16.sp),
                            textAlign: TextAlign.left,
                          )),
                      RoundedTextFormField(
                        icon: Icons.person,
                        onSubmitted: (String? name) {
                          profile.name = name!;
                        },
                        // validator: Validators.required("กรุณากรอกข้อมูล"),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                          width: 0.7.sw,
                          child: Text(
                            "Email",
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
                            "Gender",
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
                            child: Text("Male"),
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
                            child: Text("Female"),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                          width: 0.7.sw,
                          child: Text(
                            "Birthday",
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
                          "Description",
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
                            onPressed: () {},
                            child: Text(
                              "Edit profile",
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

class Profile {
  String email;
  String password;
  String repassword;
  String name;
  String birth;
  Profile(
      {required this.email,
      required this.password,
      required this.repassword,
      required this.name,
      required this.birth});
}
