import 'package:cnemax/components/botton/icon_button.dart';
import 'package:cnemax/components/onOffButton.dart';
import 'package:cnemax/services/text_styleSheet.dart';
import 'package:flutter/material.dart';

class Security_page extends StatelessWidget {
  const Security_page({super.key});

  @override
  Widget build(BuildContext context) {
    bool on = true;
    bool off = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Appcolor.black,
        title: Text("Security"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            OnOffButton(title: 'Remember Me', Value: on),
            OnOffButton(title: 'Biometric ID', Value: off),
            OnOffButton(title: 'Face ID', Value: on),
            OnOffButton(title: 'SMS Authenticator', Value: off),
            OnOffButton(title: 'Google Authonticatior', Value: on),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Device Managment',
                  style: AppTextStyle.fs16Normal,
                ),
                Icon(Icons.keyboard_arrow_down_sharp)
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Icon_Button(
                btnName: 'Change Password',
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
