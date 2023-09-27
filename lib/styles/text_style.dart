import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

//parametro opcional en un metodo?

TextStyle textStyle(Color color, [bool? negrita]) {
  return TextStyle(
    color: color,
    decoration: negrita == null
        ? TextDecoration.none
        : negrita
            ? TextDecoration.underline
            : TextDecoration.none,
    fontSize: 15.sp,
  );
}
