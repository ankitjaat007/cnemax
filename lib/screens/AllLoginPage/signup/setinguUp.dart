import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/screens/AllLoginPage/signIn/SignIn_password.dart';
import 'package:cnemax/services/app_icon&image.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class Seting_up extends StatelessWidget {
  const Seting_up({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(),
          Center(
            child: Column(
              children: [
                Image.asset(AppIcons.allSet),
                Text(
                  'You ‘re All Set!',
                  style: AppTextStyle.fs24Bold,
                ),
                Text(
                  'Start exploring the latest moive showtimes and ticket options',
                  style: AppTextStyle.fs16Normal,
                  textAlign: TextAlign.center,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Icon_Button(
              btnName: 'Lsts start  Watching',
              onpressed: () {
                App_Service.push_remove_screen(SignIn_With_Pasword(), context);
              },
              textclr: Appcolor.white,
              bgcolor: Appcolor.orange,
            ),
          )
        ],
      ),
    );
  }
}
