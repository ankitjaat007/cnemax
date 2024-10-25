import 'package:flutter/material.dart';

//===================
//        color sheet
//===================
class Appcolor {
  static Color white = Color(0xffFFFFFF);
  static Color black = Color(0xff000000);
  static Color orange = Color(0xffFF6C22);
  static Color skin_clr = Color(0xffFFD099);
  static Color wire_frame_clr = Color(0xffD9D9D9);
  static Color gray = Color(0xffF7F7F7);
  static Color red = Color(0xffB73328);
}

//===================
//      textstyle  ,fontsize&fontwaith
//===================
class AppTextStyle {
  //==Thin
  static TextStyle fs10Thin =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w100);
  //==Light
  static TextStyle fs10Light =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w300);
  //==Normal
  static TextStyle fs10Normal =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w400);
  static TextStyle fs14Normal =
      TextStyle(fontSize: 14, fontWeight: FontWeight.w400);
  static TextStyle fs16Normal =
      TextStyle(fontSize: 16, fontWeight: FontWeight.w400);
  //==Medium
  static TextStyle fs10Medium =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w500);
  static TextStyle fs18Medium =
      TextStyle(fontSize: 18, fontWeight: FontWeight.w500);
  static TextStyle fs20Medium =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500);
  //==Semi Bold
  static TextStyle fs10Semi_Bold =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w600);
  //==Bold
  static TextStyle fs10Bold =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w700);
  static TextStyle fs24Bold =
      TextStyle(fontSize: 24, fontWeight: FontWeight.w700);
  //==Extra-bold
  static TextStyle fs10Extra_bold =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w800);
  //==Thickest
  static TextStyle fs10Thickest =
      TextStyle(fontSize: 10, fontWeight: FontWeight.w900);
}
