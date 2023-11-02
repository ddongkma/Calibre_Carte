import 'package:calibre_carte/pages/about_us/widgets/about_us_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar buildAppbar() {
  return AppBar(
    iconTheme: const IconThemeData(
      color: Colors.white, //change your color here
    ),
    title: const Text(
      "Instructions",
      style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
    ),
    backgroundColor: colorTheme.appBarColor,
  );
}

Widget reusableText(String text,
    {Color color = Colors.grey,
    int fontSize = 20,
    // String fontFamily = "Montserrat",
    FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize.sp,
      // fontFamily: fontFamily,
      fontWeight: fontWeight,
    ),
  );
}

TextSpan textSpan(String text,
    {Color color = Colors.grey,
    int fontSize = 15,
    String fontFamily = "Montserrat",
    FontWeight fontWeight = FontWeight.normal}) {
  return TextSpan(
      text: text,
      style: TextStyle(
          fontFamily: fontFamily, color: color, fontSize: fontSize.sp));
}
