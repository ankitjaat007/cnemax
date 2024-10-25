import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class My_chip extends StatefulWidget {
  String txt;
  String? subtitle;

  My_chip({super.key, required this.txt, this.subtitle});

  @override
  State<My_chip> createState() => _My_chipState();
}

class _My_chipState extends State<My_chip> {
  bool backgroundColor = false, txtcolor = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          backgroundColor = !backgroundColor;
          txtcolor = !txtcolor;
        });
      },
      child: Chip(
          padding: EdgeInsets.symmetric(horizontal: 20),
          side: BorderSide(
              color: backgroundColor
                  ? Appcolor.orange
                  : Color.fromRGBO(0, 0, 0, 0.30),
              width: 1),
          backgroundColor: backgroundColor ? Appcolor.orange : Appcolor.white,
          labelStyle:
              TextStyle(color: txtcolor ? Appcolor.white : Appcolor.black),
          label: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(widget.txt),
              widget.subtitle == null ? SizedBox() : Text(widget.subtitle!)
            ],
          )),
    );
  }
}

// --------------------------------------
// select seat chip
class Select_seat_chip extends StatefulWidget {
  final bool bCcolor;
  final Function ontap;
  const Select_seat_chip(
      {super.key, required this.bCcolor, required this.ontap});

  @override
  State<Select_seat_chip> createState() => _Select_seat_chipState();
}

class _Select_seat_chipState extends State<Select_seat_chip> {
  // bool bCcolor = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.ontap();
        // setState(() {
        //   bCcolor = !bCcolor;
        // });
      },
      child: Container(
        margin: EdgeInsets.all(10),
        height: 30,
        width: 30,
        decoration: BoxDecoration(
            color: widget.bCcolor == true ? Appcolor.orange : Color(0xffD9D9D9),
            shape: BoxShape.circle),
      ),
    );
  }
}
