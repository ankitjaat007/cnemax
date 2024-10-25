import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/listTile.dart';
import 'package:cnemax/models/dummydata.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class Language_page extends StatefulWidget {
  const Language_page({super.key});

  @override
  State<Language_page> createState() => _Language_pageState();
}

class _Language_pageState extends State<Language_page> {
  String activeValue = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Appcolor.black,
        title: Text("Language"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ...List.generate(
                Dummydata().LanguageList.length,
                (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: MypayementListTile(
                        logo: Dummydata().LanguageList[index]['logo'],
                        bgclr: Color(0xffF4F4F4),
                        title: Dummydata().LanguageList[index]['title'],
                        activeValue: activeValue,
                        onCheck: (value) {
                          setState(() => activeValue = value);
                        },
                      ),
                    )),
            App_Service.add_Height(10),
            // MypayementListTile(
            //   logo: Applanguage.englishUk,
            //   bgclr: Color(0xffF4F4F4),
            //   title: 'English (UK)',
            //   activeValue: activeValue,
            //   onCheck: (value) {
            //     setState(() => activeValue = value);
            //   },
            //   boderclr: false,
            // ),
            // App_Service.add_Height(10),
            // MypayementListTile(
            //   activeValue: activeValue,
            //   onCheck: (value) {
            //     setState(() => activeValue = value);
            //   },
            //   logo: Applanguage.Spainsh,
            //   bgclr: Color(0xffF4F4F4),
            //   title: 'Spainsh',
            //   boderclr: false,
            // ),
            // App_Service.add_Height(10),
            // MypayementListTile(
            //   activeValue: activeValue,
            //   onCheck: (value) {
            //     setState(() => activeValue = value);
            //   },
            //   logo: Applanguage.Hindi,
            //   bgclr: Color(0xffF4F4F4),
            //   title: 'Hindi',
            //   boderclr: false,
            // ),
            // App_Service.add_Height(10),
            // MypayementListTile(
            //   activeValue: activeValue,
            //   onCheck: (value) {
            //     setState(() => activeValue = value);
            //   },
            //   logo: Applanguage.French,
            //   bgclr: Color(0xffF4F4F4),
            //   title: 'French',
            //   boderclr: false,
            // ),
            // App_Service.add_Height(10),
            // MypayementListTile(
            //   activeValue: activeValue,
            //   onCheck: (value) {
            //     setState(() => activeValue = value);
            //   },
            //   logo: Applanguage.Arabic,
            //   bgclr: Color(0xffF4F4F4),
            //   title: 'Arabic',
            //   boderclr: false,
            // ),
            // App_Service.add_Height(10),
            // MypayementListTile(
            //   activeValue: activeValue,
            //   onCheck: (value) {
            //     setState(() => activeValue = value);
            //   },
            //   logo: Applanguage.Russian,
            //   bgclr: Color(0xffF4F4F4),
            //   title: 'Russian',
            //   boderclr: false,
            // ),
            // App_Service.add_Height(10),
            // MypayementListTile(
            //   activeValue: activeValue,
            //   onCheck: (value) {
            //     setState(() => activeValue = value);
            //   },
            //   logo: Applanguage.Japaness,
            //   bgclr: Color(0xffF4F4F4),
            //   title: 'Japaness',
            //   boderclr: false,
            // ),
            App_Service.add_Height(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Icon_Button(
                btnName: 'Save',
                onpressed: () {},
                textclr: Appcolor.white,
                bgcolor: Appcolor.orange,
              ),
            )
          ],
        ),
      ),
    );
  }
}
