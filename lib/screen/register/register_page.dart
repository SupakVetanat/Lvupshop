import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lvup_shop/components/Rounded_PasswordField.dart';
import 'package:lvup_shop/components/Rounded_TextFormField.dart';
import 'package:lvup_shop/components/validators.dart';

class registerPage extends StatefulWidget {
  const registerPage({Key? key}) : super(key: key);

  @override
  State<registerPage> createState() => _registerPageState();
}

class _registerPageState extends State<registerPage> {
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
                // height: 1.2.sh,
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
                      CircleAvatar(
                          radius: 0.25.sw, // Image radius
                          backgroundImage: NetworkImage(
                            'https://pbs.twimg.com/media/FYhq1n0XwAAqKil?format=jpg&name=medium',
                          )),
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
                        validator: Validators.required("กรุณากรอกข้อมูล"),
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
                        validator: Validators.compose([
                          Validators.required("กรุณากรอกข้อมูล"),
                          Validators.email(
                              "อีเมลต้องประกอบด้วย @ และ . ตามลำดับ")
                        ]),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                          width: 0.7.sw,
                          child: Text(
                            "Password",
                            style: TextStyle(fontSize: 16.sp),
                            textAlign: TextAlign.left,
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      RoundedPasswordField(
                        validator: Validators.compose([
                          Validators.required("กรุณากรอกข้อมูล"),
                          Validators.minLength(
                              8, "รหัสผ่านต้องไม่น้อยว่า 8 ตัวอักษร")
                        ]),
                        onSubmitted: (String? pass) {
                          profile.password = pass!;
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      SizedBox(
                          width: 0.7.sw,
                          child: Text(
                            "Re-Password",
                            style: TextStyle(fontSize: 16.sp),
                            textAlign: TextAlign.left,
                          )),
                      SizedBox(
                        height: 10.h,
                      ),
                      RoundedPasswordField(
                        validator: Validators.compose([
                          Validators.required("กรุณากรอกข้อมูล"),
                          Validators.minLength(
                              8, "รหัสผ่านต้องไม่น้อยว่า 8 ตัวอักษร"),
                          Validators.patternString(
                              profile.password, "รหัสผ่านต้องเหมือนกัน")
                        ]),
                        onSubmitted: (String? pass) {
                          profile.repassword = pass!;
                        },
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
                      SizedBox(
                        height: 10.h,
                      ),
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
                      ClipRRect(
                        borderRadius: BorderRadius.circular(10.r),
                        child: FlatButton(
                            color: Color(0xffeec643),
                            padding: EdgeInsets.all(15.r),
                            onPressed: () {
                              formkey.currentState?.save();
                              bool validate = formkey.currentState!.validate();
                              if (validate) {
                                print("ชื่อ = ${profile.name} อีเมล = ${profile.email} " +
                                    "รหัสผ่าน = ${profile.password} ยืนยันรหัสผ่าน = ${profile.repassword}");
                                formkey.currentState?.reset();
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) {
                                //       return loginPage();
                                //     }))
                                ;
                              }
                            },
                            child: Text(
                              "Submite",
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
