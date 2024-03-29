import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_utils/src/extensions/internacionalization.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:lvup_shop/components/Rounded_TextFormField.dart';
import 'package:lvup_shop/components/navbar.dart';
import 'package:lvup_shop/components/validators.dart';
import 'package:lvup_shop/models/Profile_model.dart';
import 'package:lvup_shop/models/item_model.dart';

class addItemPage extends StatefulWidget {
  Profile user;
  addItemPage(this.user, {Key? key}) : super(key: key);

  @override
  State<addItemPage> createState() => _addItemPageState();
}

class _addItemPageState extends State<addItemPage> {
  File? _image;
  Future getImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;

    final imageTemporary = File(image.path);
    setState(() {
      this._image = imageTemporary;
    });
    Uint8List? imageBytes = await _image?.readAsBytesSync();
    String base64Image = base64.encode(imageBytes!);
    // print(base64Image);
    Items.imageUrl = base64Image;
  }

  final formkey = GlobalKey<FormState>();
  Item Items = Item(
      name: '',
      category: '',
      imageUrl: '',
      price: 0,
      isRecommended: false,
      isPopular: false,
      detail: 'test');

  @override
  Widget build(BuildContext context) {
    print(widget.user.username);
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
                        decoration: BoxDecoration(
                          color: Color(0XFFF9F9F9),
                        ),
                        child: Form(
                            key: formkey,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
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
                                                  'assets/images/59961.jpg',
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
                                        "Title",
                                        style: TextStyle(fontSize: 16.sp),
                                        textAlign: TextAlign.left,
                                      )),
                                  RoundedTextFormField(
                                    validator:
                                        Validators.required("กรุณากรอกข้อมูล"),
                                    onSubmitted: (String? name) {
                                      Items.name = name!;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                      width: 0.7.sw,
                                      child: Text(
                                        "Category",
                                        style: TextStyle(fontSize: 16.sp),
                                        textAlign: TextAlign.left,
                                      )),
                                  RoundedTextFormField(
                                    validator:
                                        Validators.required("กรุณากรอกข้อมูล"),
                                    onSubmitted: (String? category) {
                                      Items.category = category!;
                                    },
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                      width: 0.7.sw,
                                      child: Text(
                                        "Price",
                                        style: TextStyle(fontSize: 16.sp),
                                        textAlign: TextAlign.left,
                                      )),
                                  RoundedTextFormField(
                                    validator:
                                        Validators.required("กรุณากรอกข้อมูล"),
                                    keyboard: TextInputType.number,
                                    onSubmitted: (String? price) {
                                      Items.price = double.parse(price!);
                                    },
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  SizedBox(
                                      width: 0.7.sw,
                                      child: Text(
                                        "Detail",
                                        style: TextStyle(fontSize: 16.sp),
                                        textAlign: TextAlign.left,
                                      )),
                                  RoundedTextFormField(
                                    validator:
                                        Validators.required("กรุณากรอกข้อมูล"),
                                    onSubmitted: (String? detail) {
                                      Items.detail = detail!;
                                    },
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
                                          bool validate =
                                              formkey.currentState!.validate();
                                          formkey.currentState?.save();
                                          print(
                                              "name ${Items.name} category ${Items.category} price ${Items.price} detail ${Items.detail} imageUrl ${Items.imageUrl}");

                                          if (validate) {
                                            formkey.currentState?.reset();
                                            createItem(
                                                "${widget.user.username}",
                                                Items.price,
                                                Items.name,
                                                Items.category,
                                                Items.imageUrl,
                                                Items.detail,
                                                context);
                                          }
                                        },
                                        child: Text(
                                          "Submit".tr,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17.sp),
                                        )),
                                  ),
                                  SizedBox(
                                    height: 20.h,
                                  ),
                                ])))))));
  }

  createItem(String username, double price, String name, String category,
      String image, String detail, context) async {
    Map<String, dynamic> body = {
      'username': username,
      'name': name,
      'category': category,
      "price": price,
      'image': image,
      'detail': detail,
    };
    final response = await http.post(
      Uri.parse('https://lvupshopapi.herokuapp.com/order/post'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(body),
    );
    print(response.statusCode);

    if (response.statusCode == 200) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      print(jsonDecode(response.body));
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("ลงขายสินค้าสำเร็จ"),
          content: Text("ระบบได้ทำการบันทึกรายการสินค้าของท่านเรียบร้อยแล้ว"),
          actions: [
            TextButton(
                onPressed: () => Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) => navBar(widget.user))),
                child: Text('OK'))
          ],
        ),
      );
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text("กรุณาลองใหม่"),
          content: Text("เกิดข้อผิดพลาดกรุณาลองใหม่อีกครั้ง"),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text('OK'))
          ],
        ),
      );
      throw Exception('Failed to create Item.');
    }
  }
}
