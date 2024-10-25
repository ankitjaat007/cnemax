import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/textField.dart';
import 'package:cnemax/screens/AllLoginPage/ForgotPage/otp_page.dart';
import 'package:cnemax/services/app_icon&image.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class ResetPasword extends StatelessWidget {
  const ResetPasword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.white,
      appBar: AppBar(
        backgroundColor: Appcolor.white,
        elevation: 0,
        foregroundColor: Appcolor.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Reset your Password',
                      style: AppTextStyle.fs24Bold,
                    ),
                    Image.asset(AppIcons.key)
                  ],
                ),
                App_Service.add_Height(15),
                Text(
                    'Please enter your email and we will send on OTP code in the reset shop to reset your password'),
                App_Service.add_Height(15),
                Text('Email'),
                My_TextField(
                  hintText: 'rahul490@gmail.com',
                  suffixIcon: Icons.check_circle,
                )
              ],
            ),
            Icon_Button(
              btnName: 'Continue',
              onpressed: () {
                App_Service.push_to_screen(Otp_page(), context);
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
