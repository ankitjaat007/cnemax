import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/listTile.dart';
import 'package:cnemax/models/dummydata.dart';
import 'package:cnemax/services/app_icon&image.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class Payment_page extends StatefulWidget {
  const Payment_page({super.key});

  @override
  State<Payment_page> createState() => _Payment_pageState();
}

class _Payment_pageState extends State<Payment_page> {
  String activeValue = "";
  @override
  Widget build(BuildContext context) {
    var hour = DateTime.now().hour;
    var min = DateTime.now().minute;

    return Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: Icon_Button(
            iconimages: AppIcons.plus,
            btnName: 'Add New Payment ',
            onpressed: () {},
            textclr: Appcolor.white,
            bgcolor: Appcolor.orange,
          ),
        ),
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Appcolor.black,
          title: Text("Review Summary"),
          centerTitle: true,
          actions: [
            Center(
                child: Text(
              '$hour:$min',
              style: AppTextStyle.fs16Normal,
            )),
          ],
        ),
        body: Column(children: [
          ...List.generate(
            Dummydata().PaymentList.length,
            (index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: MypayementListTile(
                logo: Dummydata().PaymentList[index]['logo'],
                bgclr: Color(0xffF4F4F4),
                title: Dummydata().PaymentList[index]['title'],
                activeValue: activeValue,
                onCheck: (value) {
                  setState(() => activeValue = value);
                },
              ),
            ),
          )
          // Padding(
          //   padding: const EdgeInsets.all(8.0),

          // child: Column(
          //   children: [
          //     MypayementListTile(
          //       logo: AppIcons.Paypal,
          //       bgclr: Color(0xffF4F4F4),
          //       title: 'Paypal',
          //       activeValue: activeValue,
          //       onCheck: (value) {
          //         setState(() => activeValue = value);
          //       },
          //     ),
          //     App_Service.add_Height(10),
          //     MypayementListTile(
          //       logo: AppIcons.google,
          //       title: 'Google',
          //       bgclr: Color(0xffF4F4F4),
          //       activeValue: activeValue,
          //       onCheck: (value) {
          //         setState(() => activeValue = value);
          //       },
          //       scale: 0.5,
          //     ),
          //     App_Service.add_Height(10),
          //     MypayementListTile(
          //       logo: AppIcons.apple,
          //       bgclr: Color(0xffF4F4F4),
          //       title: 'Apple',
          //       activeValue: activeValue,
          //       onCheck: (value) {
          //         setState(() => activeValue = value);
          //       },
          //       scale: 0.5,
          //     ),
          //     App_Service.add_Height(10),
          //     MypayementListTile(
          //       logo: AppIcons.wallet,
          //       bgclr: Color(0xffF4F4F4),
          //       title: '-----4445',
          //       activeValue: activeValue,
          //       onCheck: (value) {
          //         setState(() => activeValue = value);
          //       },
          //     ),
          //     App_Service.add_Height(10),
          //     MypayementListTile(
          //       logo: AppIcons.visa,
          //       bgclr: Color(0xffF4F4F4),
          //       title: '-----57666',
          //       activeValue: activeValue,
          //       onCheck: (value) {
          //         setState(() => activeValue = value);
          //       },
          //     ),
          //   ],
          // ),
          // ),
        ]));
  }
}
