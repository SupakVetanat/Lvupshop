import 'package:flutter/material.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:lvup_shop/components/Rounded_TextFormField.dart';
import 'package:lvup_shop/components/validators.dart';
import 'package:lvup_shop/models/Profile_model.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final formkey = GlobalKey<FormState>();
  Profile profile = Profile(
      email: ' ',
      password: ' ',
      username: ' ',
      repassword: ' ',
      birth: '',
      gender: '',
      profileImage: '');
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
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 130.h),
                  child: Center(
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: Color(0xFF242F40),
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20.h),
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
                        profile.username = name!;
                      },
                      validator: Validators.required("กรุณากรอกข้อมูล"),
                    ),
                  ],
                ),
                SizedBox(height: 40.h),
                TextButton(
                    onPressed: () {},
                    child: Container(
                      width: 160.w,
                      height: 50.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Color(0xffEEC643)),
                      child: Center(
                        child: Text(
                          "Submit",
                          style: TextStyle(color: Colors.white, fontSize: 28),
                        ),
                      ),
                    )),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
