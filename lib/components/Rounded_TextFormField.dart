import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedTextFormField extends StatelessWidget {
  final bool obscureText;
  final void Function(String?)? onSubmitted;
  final IconData? icon;
  final validator;
  final TextInputType keyboard;
  final String? helperText;
  final String? hintText;
  String? initialValue;

  RoundedTextFormField({
    Key? key,
    required this.onSubmitted,
    this.icon,
    this.validator,
    this.keyboard = TextInputType.text,
    this.obscureText = false,
    this.helperText,
    this.hintText,
    this.initialValue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.r),
      width: 290.w,
      child: TextFormField(
        // style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        obscureText: obscureText,
        keyboardType: keyboard,
        validator: validator,
        initialValue: initialValue,
        onSaved: onSubmitted,
        decoration: InputDecoration(
            hintText: hintText,
            helperText: helperText,
            contentPadding: EdgeInsets.all(0),
            filled: true,
            fillColor: Color(0X6646B1C9),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.sp),
              borderSide: BorderSide.none,
            ),
            prefixIcon: Icon(
              icon,
              color: Colors.white,
            )),
      ),
    );
  }
}
