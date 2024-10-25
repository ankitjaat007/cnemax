import 'package:cnemax/controller/allController.dart';
import 'package:cnemax/models/dummydata.dart';
import 'package:cnemax/screens/Bottomnavigationpage/Account.dart';
import 'package:cnemax/screens/Bottomnavigationpage/CinemaPage.dart';
import 'package:cnemax/screens/Bottomnavigationpage/HomePage.dart';
import 'package:cnemax/screens/Bottomnavigationpage/MyTicket.dart';
import 'package:cnemax/screens/Bottomnavigationpage/PlaceOrder.dart';
import 'package:cnemax/services/text_styleSheet.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Bottomnavigationpage extends StatefulWidget {
  const Bottomnavigationpage({super.key});

  @override
  State<Bottomnavigationpage> createState() => _BottomnavigationpageState();
}

class _BottomnavigationpageState extends State<Bottomnavigationpage> {
  int indix = 0;
  @override
  Widget build(BuildContext context) {
    var db = Provider.of<AllController>(context);

    List<Widget> screen = [
      Home_page(),
      Cinema_Page(cinemamodel: db.getallcinema),
      PlaceOrder_page(),
      Myticket_page(),
      Account_page()
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          onTap: (v) {
            setState(() {
              indix = v;
            });
          },
          selectedItemColor: Appcolor.orange,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          currentIndex: indix,
          items: Dummydata()
              .BottomsheetTitalName
              .map((e) => BottomNavigationBarItem(
                  icon: Text(e,
                      style: TextStyle(
                          color: Dummydata().BottomsheetTitalName[indix] == e
                              ? Appcolor.orange
                              : Appcolor.black)),
                  label: ""))
              .toList()),
      body: screen[indix],
    );
  }
}
