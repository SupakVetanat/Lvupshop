import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:lvup_shop/components/Rounded_PasswordField.dart';
import 'package:lvup_shop/components/Rounded_TextFormField.dart';
import 'package:lvup_shop/components/navbar.dart';
import 'package:lvup_shop/components/validators.dart';

import 'Forgot_password.dart';
import 'register/register_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formkey = GlobalKey<FormState>();
  Profile profile =
      Profile(email: ' ', password: ' ', name: ' ', repassword: ' ', birth: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Center(
                    child: Container(
                      width: 280,
                      child: Image.asset("assets/images/logo.png"),
                    ),
                  ),
                ), //logo

                SizedBox(
                  height: 35.h,
                ),

                Column(
                  children: [
                    SizedBox(
                        width: 0.74.sw,
                        child: Text(
                          "EMAIL",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Color(0xFF242F40).withAlpha(950)),
                          textAlign: TextAlign.left,
                        )),
                    SizedBox(
                      height: 5.h,
                    ),
                    RoundedTextFormField(
                      icon: Icons.email,
                      onSubmitted: (String? name) {
                        profile.name = name!;
                      },
                      validator: Validators.required("กรุณากรอกข้อมูล"),
                    ),
                  ],
                ), //emailfield

                SizedBox(
                  height: 7.h,
                ),

                Column(
                  children: [
                    SizedBox(
                        width: 0.74.sw,
                        child: Text(
                          "PASSWORD",
                          style: TextStyle(
                              fontSize: 20.sp,
                              color: Color(0xFF242F40).withAlpha(950)),
                          textAlign: TextAlign.left,
                        )),
                    SizedBox(
                      height: 5.h,
                    ),
                    RoundedPasswordField(
                      validator: Validators.compose([
                        Validators.required("กรุณากรอกข้อมูล"),
                        Validators.minLength(
                            8, "รหัสผ่านต้องไม่น้อยว่า 8 ตัวอักษร"),
                      ]),
                      onSubmitted: (String? pass) {
                        profile.repassword = pass!;
                      },
                    ),
                  ],
                ), //passwordfield

                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPassword(),
                          ));
                    },
                    child: Padding(
                      padding: EdgeInsets.only(left: 190.w),
                      child: Container(
                        width: 100.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xffF24333)),
                        child: Center(
                          child: Text(
                            "Forgot pass",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ),
                    )), //ปุ่ม forgot password

                SizedBox(height: 5.h),

                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => navBar(),
                          ));
                    },
                    child: Container(
                      width: 160.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xff46B1C9)),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ),
                    )), // ปุ่ม login

                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => registerPage(),
                          ));
                    },
                    child: Container(
                      width: 160.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffEEC643)),
                      child: Center(
                        child: Text(
                          "Register",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ),
                    )), //ปุ่ม register
              ],
            ),
          ),
        ),
      ),
    );
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
