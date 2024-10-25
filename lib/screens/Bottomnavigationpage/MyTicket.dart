import 'package:cnemax/screens/ticket/canceled/Canceled.dart';
import 'package:cnemax/screens/ticket/passed/Passed.dart';
import 'package:cnemax/screens/ticket/upcomming/Upcomming.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class Myticket_page extends StatelessWidget {
  const Myticket_page({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Appcolor.white,
          elevation: 0,
          centerTitle: true,
          title: Text('My ticket'),
          foregroundColor: Appcolor.black,
          bottom: TabBar(
            indicatorColor: Appcolor.orange,
            labelColor: Appcolor.black,
            labelStyle: AppTextStyle.fs16Normal,
            tabs: [
              Tab(text: 'Up Comming'),
              Tab(text: 'Passed'),
              Tab(
                text: 'Canceled',
              )
            ],
          ),
        ),
        body:
            TabBarView(children: [UpComming(), Passed_page(), Canceled_page()]),
      ),
    );
  }
}
