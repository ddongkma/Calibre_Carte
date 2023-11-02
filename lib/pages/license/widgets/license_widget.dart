import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget reusableText(String text,
    {Color color = Colors.grey,
      int fontSize = 14,
      String fontFamily = "Montserrat",
      }) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize.sp,
      fontFamily: fontFamily,

    ),
  );
}