import 'dart:js';

import 'package:flutter/material.dart';
import 'package:calibre_carte/providers/color_theme_provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

ColorTheme colorTheme=Provider.of(context as BuildContext);
AppBar buildAppbar(){
  return AppBar(
    iconTheme: IconThemeData(
      color: Colors.white, //change your color here
    ),
    title: Text(
      "About Calibre Carte",
      style: TextStyle(fontFamily: 'Montserrat', color: Colors.white),
    ),
    backgroundColor: colorTheme.appBarColor,
  );
}

Widget reusableText(String text,
    {Color color = Colors.grey,
      int fontSize = 20,
      String fontFamily = "Montserrat",
      FontWeight fontWeight = FontWeight.normal}) {
  return Text(
    text,
    style: TextStyle(
      color: color,
      fontSize: fontSize.sp,
      fontFamily: fontFamily,
      fontWeight: fontWeight,
    ),
  );
}