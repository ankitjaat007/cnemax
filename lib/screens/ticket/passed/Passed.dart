import 'package:cnemax/models/dummydata.dart';
import 'package:cnemax/screens/ticket/passed/passevent.dart';
import 'package:cnemax/screens/ticket/passed/passfood.dart';
import 'package:cnemax/screens/ticket/passed/passmovie.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class Passed_page extends StatefulWidget {
  const Passed_page({super.key});

  @override
  State<Passed_page> createState() => _Passed_pageState();
}

class _Passed_pageState extends State<Passed_page> {
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
        return Passmovie();
      case 1:
        return Passfood();
      case 2:
        return Passevent();
    }
  }
}
