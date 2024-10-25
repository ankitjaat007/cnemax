import 'package:cnemax/services/app_services.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Icon_Button extends StatelessWidget {
  String btnName;
  String? iconimages;
  Color? textclr, bgcolor, borderclr, imagecolor;
  Function onpressed;
  Icon_Button({
    super.key,
    required this.btnName,
    required this.onpressed,
    this.textclr,
    this.bgcolor,
    this.iconimages,
    this.borderclr,
    this.imagecolor,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
        onPressed: () => onpressed(),
        icon: iconimages == null
            ? SizedBox()
            : Image.asset(
                iconimages!,
                color: imagecolor,
              ),
        label: Text(
          btnName,
          style: TextStyle(color: textclr),
        ),
        style: TextButton.styleFrom(
            backgroundColor: bgcolor,
            minimumSize: Size(App_Service.getscreenwidth(context), 40),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
            side: borderclr == null 
                ? BorderSide.none
                : BorderSide(color: borderclr!)));
  }
}
