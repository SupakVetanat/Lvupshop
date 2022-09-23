import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/src/size_extension.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:lvup_shop/components/Rounded_PasswordField.dart';
import 'package:lvup_shop/components/Rounded_TextFormField.dart';
import 'package:lvup_shop/components/navbar.dart';
import 'package:lvup_shop/components/validators.dart';
import 'package:lvup_shop/models/Profile_model.dart';

import 'Forgot_password.dart';
import 'register/register_page.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Map? _userData;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // bool _isLoggedIn = false;
  // Map _userObj = {};
  final formkey = GlobalKey<FormState>();
  Profile profile = Profile(
      email: ' ',
      password: ' ',
      repassword: ' ',
      birth: '',
      username: '',
      profileImage: '',
      gender: '',
      description: '');
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
                        profile.username = name!;
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
                            builder: (context) => navBar(profile),
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

                Center(
                  child: FloatingActionButton.extended(
                    onPressed: () {
                      loginUI();
                    },
                    icon: Image.asset(
                      'assets/images/googlelogo.png',
                      height: 35,
                      width: 65,
                    ),
                    label: Text(
                      'Sign in with Google',
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),

                SizedBox(
                  height: 7.h,
                ),

                Center(
                  child: FloatingActionButton.extended(
                    onPressed: () async {
                      final result = await FacebookAuth.i
                          .login(permissions: ["public_profile", "email"]);
                      print("result.status: ${result.status}");

                      if (result.status == LoginStatus.success) {
                        final requestData = await FacebookAuth.i.getUserData(
                          fields: "email, name",
                        );
                        setState(() {
                          _userData = requestData;
                        });
                      }
                    },
                    icon: Image.asset(
                      'assets/images/fblogo.png',
                      height: 32,
                      width: 50,
                    ),
                    label: Text(
                      'Sign in with Facebook',
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  loginUI() async {
    // Provider.of<GoogleSignInController>(context, listen: false).login();
    // await (Navigator.push(
    //     context,
    //     MaterialPageRoute(
    //       builder: (context) => navBar(),
    //     )));
    GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        'https://www.googleapis.com/auth/contacts.readonly',
      ],
    );
    GoogleSignInAccount? user = await _googleSignIn.signIn();

    if (user != null) {
      print("user ${user}");
      var img64 = await networkImageToBase64(user.photoUrl);
      profile = Profile(
          email: user.email,
          password: '',
          username: user.displayName,
          repassword: '',
          birth: '',
          profileImage: img64,
          gender: '',
          description: '');
      print(profile.profileImage);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => navBar(profile)));
    }

    // GoogleSignInAuthentication? userAuth = await user?.authentication;

    // await _auth.signInWithCredential(GoogleAuthProvider.getCredential(
    //     idToken: userAuth?.idToken, accessToken: userAuth?.accessToken));
    // checkAuth(context); // after success route to home.
  }

  // Future checkAuth(BuildContext context) async {
  //   User user = await _auth.currentUser!;
  //   if (user != null) {
  //     print("Already singed-in with");
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => navBar()));
  //   }
  // }
}

Future<String?> networkImageToBase64(String? imageUrl) async {
  http.Response response = await http.get(Uri.parse(imageUrl!));
  final bytes = response.bodyBytes;
  return (bytes != null ? base64Encode(bytes) : null);
}
