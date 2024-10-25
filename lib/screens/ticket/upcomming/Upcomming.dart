import 'package:cnemax/models/dummydata.dart';
import 'package:cnemax/screens/ticket/upcomming/upEvent.dart';
import 'package:cnemax/screens/ticket/upcomming/upFood.dart';
import 'package:cnemax/screens/ticket/upcomming/upMovie.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class UpComming extends StatefulWidget {
  const UpComming({super.key});

  @override
  State<UpComming> createState() => _UpCommingState();
}

class _UpCommingState extends State<UpComming> {
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
        return Upmovie();
      case 1:
        return Upfood();
      case 2:
        return Upevnt();
    }
  }
}
