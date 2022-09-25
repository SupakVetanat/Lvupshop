import 'package:firebase_auth/firebase_auth.dart';
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
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password reset link check your email'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  } //passreset

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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: TextField(
                        controller: _emailController,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xFF242F40),
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          hintText: 'Enter your Email',
                          fillColor: Colors.grey[200],
                          filled: true,
                        ),
                      ),
                    ), //padding

                    SizedBox(height: 40.h),

                    MaterialButton(
                      onPressed: passwordReset,
                      child: Container(
                        width: 160.w,
                        height: 50.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffEEC643)),
                        child: Center(
                          child: Text(
                            'Submid',
                            style: TextStyle(color: Colors.white, fontSize: 28),
                          ),
                        ),
                      ),
                      color: Color(0xffEEC643),
                    ),
                  ],
                ),
                //SizedBox(height: 40.h),
                // TextButton(
                //     onPressed: () {},
                //     child: Container(
                //       width: 160.w,
                //       height: 50.h,
                //       decoration: BoxDecoration(
                //           borderRadius: BorderRadius.circular(10),
                //           color: Color(0xffEEC643)),
                //       child: Center(
                //         child: Text(
                //           "Submit",
                //           style: TextStyle(color: Colors.white, fontSize: 28),
                //         ),
                //       ),
                //     )),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
