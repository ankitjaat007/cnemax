import 'package:cnemax/models/dummydata.dart';
import 'package:cnemax/screens/ticket/canceled/canevent.dart';
import 'package:cnemax/screens/ticket/canceled/canfood.dart';
import 'package:cnemax/screens/ticket/canceled/canmovie.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class Canceled_page extends StatefulWidget {
  const Canceled_page({super.key});

  @override
  State<Canceled_page> createState() => _Canceled_pageState();
}

class _Canceled_pageState extends State<Canceled_page> {
  var value = 0;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
                Dummydata().MyticketBtn.length,
                (index) => GestureDetector(
                      onTap: () {
                        setState(() {
                          value = index;
                        });
                      },
                      child: Chip(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                              side: BorderSide(
                                  color: value == index
                                      ? Colors.transparent
                                      : Appcolor.black)),
                          backgroundColor: value == index
                              ? Appcolor.orange
                              : Colors.transparent,
                          label: Text(
                            Dummydata().MyticketBtn[index],
                            style: TextStyle(
                                color: value == index
                                    ? Appcolor.white
                                    : Appcolor.black),
                          )),
                    )),
          ),
          btnscreen(value)
        ],
      ),
    );
  }

  btnscreen(int i) {
    switch (i) {
      case 0:
        return Canmovie();
      case 1:
        return Canfood();
      case 2:
        return Canevent();
    }
  }
}
