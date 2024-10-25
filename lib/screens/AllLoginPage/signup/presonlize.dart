import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/my_chip.dart';
import 'package:cnemax/screens/AllLoginPage/signup/setinguUp.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class Presonlize extends StatelessWidget {
  const Presonlize({super.key});

  @override
  Widget build(BuildContext context) {
    // List<String> tag = [];

    return Scaffold(
      backgroundColor: Appcolor.white,
      appBar: AppBar(
        backgroundColor: Appcolor.white,
        elevation: 0,
        foregroundColor: Appcolor.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('Presonalize Your Movie Experince',
                    style: AppTextStyle.fs24Bold),
                App_Service.add_Height(10),
                Text(
                    'Tel u syour prefrence to get customize movie recommandations trailed just for yoi You can alwayschange it later'),
                App_Service.add_Height(20),
                Wrap(
                  spacing: 20,
                  children: [
                    My_chip(txt: 'Action'),
                    My_chip(txt: 'Sports'),
                    My_chip(txt: 'Westren'),
                    My_chip(txt: 'War'),
                    My_chip(txt: 'Family'),
                    My_chip(txt: 'Advanture'),
                    My_chip(txt: 'Comedy'),
                    My_chip(txt: 'Drama'),
                    My_chip(txt: 'Science Fictions '),
                    My_chip(txt: 'Tharilor'),
                    My_chip(txt: 'Horror'),
                    My_chip(txt: 'Animation'),
                    My_chip(txt: 'Crime'),
                    My_chip(txt: 'Mystery'),
                    My_chip(txt: 'War'),
                    My_chip(txt: 'Family'),
                  ],
                )
              ],
            ),
            Icon_Button(
              btnName: 'Sign Up',
              onpressed: () {
                App_Service.push_to_screen(Seting_up(), context);
              },
              textclr: Appcolor.white,
              bgcolor: Appcolor.orange,
            )
          ],
        ),
      ),
    );
  }
}
