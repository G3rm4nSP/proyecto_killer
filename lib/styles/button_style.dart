import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

ButtonStyle buttonStyle() {
  return ButtonStyle(
      maximumSize: MaterialStateProperty.all<Size>(Size(100.w, 8.h)),
      minimumSize: MaterialStateProperty.all<Size>(Size(70.w, 7.h)),
      backgroundColor: MaterialStateProperty.all<Color>(
          const Color.fromARGB(255, 129, 195, 224)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      )));
}

TextStyle buttonTextStyle() {
  return TextStyle(
    color: Colors.white, //negrita
    fontWeight: FontWeight.bold,
    fontSize: 15.sp,
  );
}
