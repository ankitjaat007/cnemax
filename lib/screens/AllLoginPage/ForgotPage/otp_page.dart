import 'dart:async';

import 'package:cnemax/screens/AllLoginPage/ForgotPage/newpasword.dart';
import 'package:cnemax/services/app_icon&image.dart';
import 'package:cnemax/services/app_services.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Otp_page extends StatelessWidget {
  const Otp_page({super.key});

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
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'OTP code Verification ',
                style: AppTextStyle.fs24Bold,
              ),
              Image.asset(AppIcons.lock)
            ],
          ),
          Text(
              'we have sent an OTP code to your email rahu*****@gmil.com enter the OTP code below to verify'),
          App_Service.add_Height(15),
          PinCodeTextField(
            obscureText: true,
            showCursor: false,
            autoFocus: true,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            enableActiveFill: true,
            appContext: context,
            length: 5,
            keyboardType: TextInputType.number,
            pinTheme: PinTheme(
                shape: PinCodeFieldShape.box,
                borderRadius: BorderRadius.circular(15),
                fieldHeight: 40,
                fieldWidth: 40,
                activeColor: Appcolor.white,
                activeFillColor: Appcolor.gray,
                selectedColor: Appcolor.orange,
                selectedFillColor: Appcolor.skin_clr,
                inactiveColor: Appcolor.white,
                inactiveFillColor: Appcolor.white),
            onChanged: (pin) {},
            onCompleted: (pin) {
              App_Service.push_and_replace(New_password(), context);
            },
          ),
          Text('Don’t Receive email?'),
          App_Service.add_Height(15),
          // Timer.periodic(Duration(seconds:), (timer) { }),
          Text('You can resend code in 0 3s'),
        ]),
      ),
    );
  }
}
