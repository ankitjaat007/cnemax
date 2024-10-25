import 'package:flutter/material.dart';

// ignore: must_be_immutable
class My_TextField extends StatelessWidget {
  String? hintText;
  IconData? prefixIcon, suffixIcon;
  Function? onpressed;
  TextEditingController? controller;
  bool obsecuse;
  My_TextField({
    super.key,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obsecuse = false,
    this.onpressed,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: obsecuse,
      decoration: InputDecoration(
        prefixIcon: prefixIcon == null
            ? SizedBox()
            : Icon(prefixIcon, color: Color.fromRGBO(0, 0, 0, 0.5)),
        suffixIcon: IconButton(
            onPressed: onpressed != null ? () => onpressed!() : null,
            icon: Icon(
              suffixIcon,
              color: Color.fromRGBO(0, 0, 0, 0.5),
            )),
        fillColor: Color(0xffF3F3F3),
        filled: true,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.30))),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Color.fromRGBO(0, 0, 0, 0.30))),
      ),
    );
  }
}
