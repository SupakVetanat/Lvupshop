import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RoundedPasswordField extends StatefulWidget {
  final void Function(String?)? onSubmitted;
  final validator;
  RoundedPasswordField(
      {Key? key, required this.onSubmitted, required this.validator})
      : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 290.w,
        child: TextFormField(
          obscureText: _obscureText,
          onChanged: widget.onSubmitted,
          validator: widget.validator,
          decoration: InputDecoration(
              contentPadding: EdgeInsets.all(0),
              filled: true,
              fillColor: Color(0X6646B1C9),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.sp),
                borderSide: BorderSide.none,
              ),
              prefixIcon: Icon(
                Icons.lock,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.visibility,
                  color: Colors.white,
                ),
                onPressed: () {
                  _toggle();
                },
              )),
        ));
  }
}
